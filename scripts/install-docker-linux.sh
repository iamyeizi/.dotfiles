#!/usr/bin/env bash
set -euo pipefail

dry_run=0
if [[ ${1:-} == --dry-run ]]; then
    dry_run=1
elif (( $# )); then
    echo 'Usage: install-docker-linux.sh [--dry-run]' >&2
    exit 2
fi

if [[ ! -f /etc/os-release ]]; then
    echo 'Docker installation requires Ubuntu or Debian.' >&2
    exit 1
fi
# shellcheck source=/dev/null
source /etc/os-release
if [[ ${ID:-} != ubuntu && ${ID:-} != debian ]] || [[ -z ${VERSION_CODENAME:-} ]]; then
    echo 'Docker installation supports Ubuntu and Debian releases with a VERSION_CODENAME.' >&2
    exit 1
fi

installed() {
    dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -qx 'install ok installed'
}

run() {
    if (( dry_run )); then
        printf 'Would run:'
        printf ' %q' "$@"
        printf '\n'
    else
        "$@"
    fi
}

if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
    echo 'An existing Docker installation with Compose was found; leaving it intact.'
    exit 0
fi

conflicting=(docker.io docker-compose docker-compose-v2 docker-doc docker-buildx podman-docker containerd runc)
found=()
for package in "${conflicting[@]}"; do
    if installed "$package"; then found+=("$package"); fi
done
if (( ${#found[@]} )); then
    printf 'Existing Docker-related apt packages need manual review: %s\n' "${found[*]}" >&2
    echo 'No packages or Docker data were removed.' >&2
    exit 1
fi
if command -v docker >/dev/null 2>&1 && ! installed docker-ce; then
    echo 'An unmanaged Docker CLI is present; inspect it before adding Docker Engine.' >&2
    exit 1
fi

if [[ $EUID -eq 0 ]]; then
    as_root=()
else
    as_root=(sudo)
fi

keyring=/etc/apt/keyrings/docker.asc
source_file=/etc/apt/sources.list.d/docker.sources
if [[ ! -f $source_file ]]; then
    run "${as_root[@]}" install -m 0755 -d /etc/apt/keyrings
    run "${as_root[@]}" curl -fsSL "https://download.docker.com/linux/$ID/gpg" -o "$keyring"
    run "${as_root[@]}" chmod a+r "$keyring"
    architecture=$(dpkg --print-architecture)
    source_text=$(printf 'Types: deb\nURIs: https://download.docker.com/linux/%s\nSuites: %s\nComponents: stable\nArchitectures: %s\nSigned-By: %s\n' "$ID" "$VERSION_CODENAME" "$architecture" "$keyring")
    if (( dry_run )); then
        printf 'Would write %s:\n%s\n' "$source_file" "$source_text"
    else
        printf '%s\n' "$source_text" | "${as_root[@]}" tee "$source_file" >/dev/null
    fi
fi

required=(docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin)
missing=()
for package in "${required[@]}"; do
    if ! installed "$package"; then missing+=("$package"); fi
done
if (( ${#missing[@]} )); then
    run "${as_root[@]}" apt-get update
    run "${as_root[@]}" apt-get install -y "${missing[@]}"
fi

if (( dry_run )); then
    echo 'Would verify Docker Engine and the Compose plugin.'
    exit 0
fi
if command -v systemctl >/dev/null 2>&1 && ! systemctl is-active --quiet docker; then
    "${as_root[@]}" systemctl start docker
fi
if ! "${as_root[@]}" docker info >/dev/null 2>&1; then
    echo 'Docker packages were installed, but the daemon is not reachable.' >&2
    exit 1
fi
docker compose version
printf 'Docker is ready. Use sudo docker unless your user already has daemon access.\n'
