#!/usr/bin/env python3
"""Back up unmanaged Stow targets, then create or repair managed links."""

from __future__ import annotations

import argparse
import os
from pathlib import Path
import shutil
import subprocess
from datetime import datetime


def source_files(package: Path):
    for root, dirs, files in os.walk(package):
        dirs[:] = [name for name in dirs if name != ".git"]
        for name in files:
            if name in {".git", ".DS_Store"}:
                continue
            source = Path(root, name)
            yield source, source.relative_to(package)


def managed_link(target: Path, source: Path) -> bool:
    return target.is_symlink() and target.resolve() == source.resolve()


def conflicts(repo: Path, target_home: Path, packages: list[str]):
    found = set()
    for package in packages:
        source_root = repo / package
        for source, relative in source_files(source_root):
            parts = relative.parts
            for count in range(1, len(parts)):
                target = target_home.joinpath(*parts[:count])
                expected = source_root.joinpath(*parts[:count])
                if target.is_symlink():
                    if managed_link(target, expected):
                        break
                    found.add(target)
                    break
                if target.exists() and not target.is_dir():
                    found.add(target)
                    break
            else:
                target = target_home / relative
                if target.exists() or target.is_symlink():
                    if not managed_link(target, source):
                        found.add(target)
    return sorted(found, key=lambda path: (len(path.parts), str(path)))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", type=Path, required=True)
    parser.add_argument("--target", type=Path, required=True)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--mode", choices=("install", "reinstall"), required=True)
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("packages", nargs="+")
    args = parser.parse_args()

    repo = args.repo.resolve()
    target_home = args.target.resolve()
    pending = conflicts(repo, target_home, args.packages)
    # A parent conflict covers all conflicts beneath it.
    selected = []
    for path in pending:
        if not any(parent == path or parent in path.parents for parent in selected):
            selected.append(path)

    if selected:
        backup = args.state / "dotfiles" / "backups" / datetime.now().strftime("%Y%m%d-%H%M%S-%f")
        for path in selected:
            destination = backup / path.relative_to(target_home)
            if args.dry_run:
                print(f"Would back up {path} -> {destination}")
            else:
                destination.parent.mkdir(parents=True, exist_ok=True)
                shutil.move(str(path), str(destination))
        if not args.dry_run:
            print(f"Backed up unmanaged files to {backup}")

    stow = ["stow", "--ignore", r"\.DS_Store$", "--dir", str(repo), "--target", str(target_home)]
    if args.mode == "reinstall":
        stow.append("--restow")
    if args.dry_run:
        print("Would run:", " ".join([*stow, *args.packages]))
    else:
        subprocess.run([*stow, *args.packages], check=True)


if __name__ == "__main__":
    main()
