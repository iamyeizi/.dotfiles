# dotfiles

## Steps to bootstrap a new Mac
<br/>

### 1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```
<br/>

### 2. [Generate a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and [add to my GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) 
<br/>

### 3. Clone repo into new hidden directory.

Use **SSH** (if set up)...
```zsh
git clone git@github.com:iamyeizi/dotfiles ~/dev/.dotfiles
```
...or use **HTTPS** and switch remotes later.
```zsh
git clone https://github.com/iamyeizi/dotfiles.git ~/dev/.dotfiles
```
<br/>

### 4. Install ***oh-my-zsh*** now
```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
<br/>

### 5. Create symlinks in the Home directory to the real files in the repo.

There are better and less manual ways to do this.
<br/>
Investigate install scripts and bootstrapping tools.

```zsh
ln -s ~/dev/.dotfiles/.zshrc ~/.zshrc
```
```zsh
ln -s ~/dev/.dotfiles/.gitconfig ~/.gitconfig
```
Conda base config
```zsh
ln -s ~/dev/.dotfiles/.condarc ~/.condarc
```
<br/>

### 6. Install Homebrew, followed by the software listed in the Brewfile.

These could also be in an install script.
<br/>
Install Homebrew

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then pass in the Brewfile location...

```zsh
brew bundle --file ~/dev/.dotfiles/Brewfile
```

...or move to the directory first.

```zsh
cd ~/dev/.dotfiles && brew bundle
```
<br/>

### 7. Setup Miniconda

```zsh
conda init "$(basename "${SHELL}")"
```
<br/>

---

## Install fonts

- [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/JetBrainsMono.zip)
- [Iosevka Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Iosevka.zip)
- [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Hack.zip)
- [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraCode.zip)
- [Consolas Font](https://www.dafontfree.io/download/consolas/?wpdmdl=71932&refresh=6452d591647521683150225&ind=1612712158037&filename=Consolas-Font.zip)
---

## Other apps

- Install missing apps such as:
  - [Authy from iPad](https://apps.apple.com/ar/app/twilio-authy/id494168017?l=en)
  - [CapCut](https://apps.apple.com/ar/app/capcut-video-editor/id1500855883?l=en)
  - [Flow](https://apps.apple.com/ar/app/flow-focus-pomodoro-timer/id1423210932?l=en)
  - [FluTooth](https://goodsnooze.gumroad.com/l/flutooth)
  - [ImageOptim](https://imageoptim.com/ImageOptim1.9.0.tar.xz) for arm
  - [Excel](https://apps.apple.com/ar/app/microsoft-excel/id462058435?l=en&mt=12) and [PowerPoint](https://apps.apple.com/ar/app/microsoft-powerpoint/id462062816?l=en&mt=12)
  - Parallels ([M1](https://haxmac.cc/?s=parallels), [M2](https://www.torrentmac.net/?s=parallels), [M3](https://nmac.to/search/?q=parallels#gsc.tab=0&gsc.q=parallels&gsc.page=1))
  - [BGH Smart Control for iPad](https://apps.apple.com/ar/app/bgh-smart-control/id934510376?l=en)
  - [StandUp](https://apps.apple.com/ar/app/standup/id1439378680?l=en&mt=12)
  - [TinkerTool](https://www.bresink.com/osx/0TinkerTool/download.php)
  - **SetApp:**
    - [Archiver](https://setapp.com/apps/archiver)
    - [Bartender](https://setapp.com/apps/bartender)
    - [ClearVPN](https://setapp.com/apps/clearvpn)
    - [iBoysoft NTFS for Mac](https://setapp.com/apps/iboysoft-ntfs-for-mac)
    - [One Switch](https://setapp.com/apps/one-switch)
    - [PopClip](https://setapp.com/apps/popclip)
    
<br />

- Learn how to use [`defaults`](https://macos-defaults.com/#%F0%9F%99%8B-what-s-a-defaults-command) to record and restore System Preferences and other macOS configurations.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Integrate other cloud services into your Dotfiles process (Dropbox, Google Drive, etc.).
