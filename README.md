# .dotfiles

- [ ] Try to setup ansible

## Steps to setup a new Mac

### [Generate a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and [add to my GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

### Clone repo into new hidden directory.

Use **SSH** (if set up)...

```zsh
git clone --branch main git@github.com:iamyeizi/dotfiles $HOME
```

...or use **HTTPS** and switch remotes later.

```zsh
git clone --branch main https://github.com/iamyeizi/.dotfiles.git $HOME
```

### Link with `./run` or `./linus`

### Submodules

```zsh
git submodule update --init --recursive
```

### Other apps

- [Authy from iPad](https://apps.apple.com/ar/app/twilio-authy/id494168017?l=en)
- [CapCut](https://apps.apple.com/ar/app/capcut-video-editor/id1500855883?l=en)
- Parallels ([M1](https://haxmac.cc/?s=parallels), [M2](https://nmac.to/search/?q=parallels#gsc.tab=0&gsc.q=parallels&gsc.page=1))
- [StandUp](https://apps.apple.com/ar/app/standup/id1439378680?l=en&mt=12)
- [CleanShot X]()
