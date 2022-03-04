# NEOVIM config

![Screenhot](./screen.png)

## Install
- Install neovim(arch linux)
```bash
yay -S neovim-nightly-bin # or just neovim for stable
```

- Install plugin manager
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

- Backup neovim your config
```bash
mv ~/.config/nvim ~/.config/nvim.old
```

- Install nvim setup 
```bash
git clone --recursive https://github.com/flof-ik/nvim.git ~/.config/nvim
```

## Make tasks
- `fmt` Format all lua files
- `lint` Lint all lua files
