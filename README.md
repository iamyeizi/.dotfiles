# dotfiles

-   [ ] It remains to make a script (`.sh`) to install everything at once.
-   Like [ThePrimeagen's dotfiles](https://github.com/ThePrimeagen/.dotfiles)

---

## Steps to bootstrap a new Mac

### Make dev, personal and work directories

```zsh
cd $HOME && mkdir -p personal work
```

### 1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```

### 2. [Generate a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and [add to my GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

### 3. Clone repo into new hidden directory.

Use **SSH** (if set up)...

```zsh
git clone --branch main git@github.com:iamyeizi/dotfiles $HOME
```

...or use **HTTPS** and switch remotes later.

```zsh
git clone --branch main https://github.com/iamyeizi/.dotfiles.git $HOME
```

### 4. Install **_oh-my-zsh_** now

```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 5. Create symlinks in the Home directory to the real files in the repo.

There are better and less manual ways to do this. Investigate install scripts and bootstrapping tools.

```zsh
ln -fs ~/.dotfiles/.zshrc ~/.zshrc
```

```zsh
ln -fs ~/.dotfiles/.tmux.conf ~/.tmux.conf
```

```zsh
ln -fs ~/.dotfiles/.vimrc ~/.vimrc
```

```zsh
ln -fs ~/.dotfiles/.ideavimrc ~/.ideavimrc
```

```zsh
ln -fs ~/.dotfiles/.gitconfig ~/.gitconfig
```

```zsh
ln -fs ~/.dotfiles/com.amethyst.Amethyst.plist ~/Library/Preferences/com.amethyst.Amethyst.plist
```

Conda base config

```zsh
ln -fs ~/.dotfiles/.condarc ~/.condarc
```

### 6. Install Homebrew, followed by the software listed in the Brewfile.

These could also be in an install script. Install Homebrew

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then pass in the Brewfile location...

```zsh
brew bundle --file ~/.dotfiles/Brewfile
```

...or move to the directory first.

```zsh
cd ~/.dotfiles && brew bundle
```

### 7. Setup Miniconda

```zsh
conda init "$(basename "${SHELL}")"
```

---

## Missing apps
-   [Authy from iPad](https://apps.apple.com/ar/app/twilio-authy/id494168017?l=en)
-   [CapCut](https://apps.apple.com/ar/app/capcut-video-editor/id1500855883?l=en)
-   Parallels ([M1](https://haxmac.cc/?s=parallels), [M2](https://nmac.to/search/?q=parallels#gsc.tab=0&gsc.q=parallels&gsc.page=1))
-   [StandUp](https://apps.apple.com/ar/app/standup/id1439378680?l=en&mt=12)
-   [Bartender](https://setapp.com/apps/bartender)
-   [iBoysoft NTFS](https://setapp.com/apps/iboysoft-ntfs-for-mac)
-   [One Switch](https://setapp.com/apps/one-switch)
-   [CleanShot X](https://setapp.com/apps/cleanshot)
-   [TouchRetouch](https://setapp.com/apps/touchretouch)
-   [ClearVPN](https://setapp.com/apps/clearvpn)
