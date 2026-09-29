# Dotfiles

Configuración personal para macOS y Ubuntu/Debian. GNU Stow enlaza `home/` al
home del usuario; en macOS también enlaza `macos/`.

## Instalar

Primero instalá Git y cloná el repositorio. En Ubuntu/Debian podés instalar Git
con `sudo apt-get update && sudo apt-get install -y git`. En una Mac nueva quizá
debas completar la instalación de Xcode Command Line Tools y repetir el comando.

```sh
git clone --recurse-submodules https://github.com/iamyeizi/.dotfiles.git "$HOME/.dotfiles"
"$HOME/.dotfiles/install"
```

El instalador detecta si ya hay enlaces gestionados, instala lo que falta y se
puede repetir. Instala Zsh si no existe, instala Oh My Zsh y recupera los
submódulos. Si cambia tu shell de inicio, abrí una terminal nueva. No reinicia
el equipo.

```sh
./install                   # Instalación inicial o paquetes faltantes
./install --dry-run         # Ver acciones y respaldos antes de ejecutarlos
./install --reinstall       # Rehacer enlaces; instalar solo paquetes faltantes
./install --docker          # Linux: agregar Docker Engine y Compose
./install --macos-defaults  # macOS: aplicar preferencias visuales opcionales
```

## Qué instala cada gestor

| Gestor | Paquetes |
| --- | --- |
| `apt` en Linux | Base del sistema y del instalador: compilador, certificados, curl, file, Git, procps, Python 3, Stow y Zsh. También sshfs, nmap, arping, telnet y herramientas de portapapeles. |
| `Brewfile.common` | CLI compartidas: Neovim, tmux, fzf, ripgrep, Bun, Biome, Python 3.14, pipenv y las demás herramientas de desarrollo. |
| `Brewfile.macos` | Fórmulas específicas de macOS y todas las apps gráficas actuales. |
| `Brewfile.linux` | Reservado para futuras fórmulas exclusivas de Linux. |

En Linux, el instalador instala Homebrew en `/home/linuxbrew/.linuxbrew` y carga
`brew shellenv` también al abrir Zsh. Ejecuta los dos Brewfiles correspondientes
sin pedir upgrades de fórmulas presentes. No instala apps gráficas en Linux.
Si una máquina vieja ya tiene alguna CLI compartida instalada con `apt`, no la
desinstala; la versión de Brew tiene prioridad en el `PATH` de Zsh.

Docker es opcional y se instala desde el repositorio `apt` oficial de Docker.
`--docker` no reemplaza una instalación existente: si encuentra paquetes que
requieren una migración, se detiene sin quitarlos. Para usar Docker sin `sudo`,
configurá el acceso al daemon por separado.

Si un archivo de destino no pertenece al repo, el instalador lo mueve a un
respaldo fechado bajo `~/.local/state/dotfiles/backups/` antes de enlazar. Podés
poner ajustes de Zsh propios de una máquina en
`~/.config/personal/local.zsh`; Git ignora ese archivo. No guardes credenciales
en este repositorio.
