# .dotfiles

## Steps to bootstrap a new Mac

### 1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```

### 2. [Generate a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and [add to my GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) 

### 3. Clone repo into new hidden directory.

Use **SSH** (if set up)...
```zsh
git clone git@github.com:iamyeizi/dotfiles ~/Developer/.dotfiles
```
...or use **HTTPS** and switch remotes later.
```zsh
git clone https://github.com/iamyeizi/dotfiles.git ~/Developer/.dotfiles
```

### 4. Create symlinks in the Home directory to the real files in the repo.

There are better and less manual ways to do this.
<br/>
Investigate install scripts and bootstrapping tools.
```zsh
ln -s ~/Developer/.dotfiles/.zshrc ~/.zshrc
```

```zsh
ln -s ~/Developer/.dotfiles/.gitconfig ~/.gitconfig
```


### 5. Install Homebrew, followed by the software listed in the Brewfile.

These could also be in an install script.
<br/>
Install Homebrew

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then pass in the Brewfile location...

```zsh
brew bundle --file ~/Developer/.dotfiles/Brewfile
```

...or move to the directory first.

```zsh
cd ~/Developer/.dotfiles && brew bundle
```

---
## TODO List

- Install missing apps such as:
  - [AdGuard for Safari](https://apps.apple.com/ar/app/adguard-for-safari/id1440147259?l=en&mt=12)
  - [Authy from iPad](https://apps.apple.com/ar/app/twilio-authy/id494168017?l=en)
  - [CapCut](https://apps.apple.com/ar/app/capcut-video-editor/id1500855883?l=en)
  - [Dark Reader for Safari](https://apps.apple.com/ar/app/dark-reader-for-safari/id1438243180?l=en)
  - [Flow](https://apps.apple.com/ar/app/flow-focus-pomodoro-timer/id1423210932?l=en)
  - [FluTooth](https://goodsnooze.gumroad.com/l/flutooth)
  - [Hand Mirror](https://apps.apple.com/ar/app/hand-mirror/id1502839586?l=en&mt=12)
  - [ImageOptim](https://imageoptim.com/ImageOptim1.9.0.tar.xz) for arm
  - [Mac Mouse Fix](https://github.com/noah-nuebling/mac-mouse-fix/releases/latest/download/MacMouseFixApp.zip)
  - [Excel](https://apps.apple.com/ar/app/microsoft-excel/id462058435?l=en&mt=12) and [Word](https://apps.apple.com/ar/app/microsoft-word/id462054704?l=en&mt=12)
  - [MonitorControl](https://github.com/MonitorControl/MonitorControl)
  - [OnyX](https://www.titanium-software.fr/en/onyx.html)
  - Parallels ([M1](https://haxmac.cc/?s=parallels), [M2](https://www.torrentmac.net/?s=parallels), [M3](https://nmac.to/search/?q=parallels#gsc.tab=0&gsc.q=parallels&gsc.page=1))
  - [BGH Smart Control for iPad](https://apps.apple.com/ar/app/bgh-smart-control/id934510376?l=en)
  - [StandUp](https://apps.apple.com/ar/app/standup/id1439378680?l=en&mt=12)
  - [Stats](https://github.com/exelban/stats/releases/latest/download/Stats.dmg)
  - [TinkerTool](https://www.bresink.com/osx/0TinkerTool/download.php)
  - [Tot](https://apps.apple.com/ar/app/tot/id1491071483?l=en&mt=12)
  - [Wappalyzer for Safari](https://apps.apple.com/ar/app/wappalyzer/id1520333300?l=en&mt=12)
  - **SetApp:**
    - [Archiver](https://setapp.com/apps/archiver)
    - [Bartender](https://setapp.com/apps/bartender)
    - [ClearVPN](https://setapp.com/apps/clearvpn)
    - [iBoysoft NTFS for Mac](https://setapp.com/apps/iboysoft-ntfs-for-mac)
    - [One Switch](https://setapp.com/apps/one-switch)
    - [PDF Squeezer](https://setapp.com/apps/pdf-squeezer)
    - [Permute](https://setapp.com/apps/permute)
    - [PopClip](https://setapp.com/apps/popclip)

- Learn how to use [`defaults`](https://macos-defaults.com/#%F0%9F%99%8B-what-s-a-defaults-command) to record and restore System Preferences and other macOS configurations.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Integrate other cloud services into your Dotfiles process (Dropbox, Google Drive, etc.).

---
## Keys

<details>
 <summary>AirBuddy</summary>

 ```
5F502BB8-8B1C573F-69F6C0BE-893B9417-1F53E973
```

</details>

<details>
  <summary>SoundSource</summary>

```
ZLAT-YM6Z-YKYD-2JUZ-F9VF-NN4C-DHX3-M2U3-J23G
```

</details>
