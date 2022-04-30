# nvim config

## Install 
- Install a nvim(arch linux)
```bash
paru -S neovim-nightly-bin
```

- Install [packer.nvim](https://github.com/wbthomason/packer.nvim)
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

- Backup your config
```bash
mv ~/.config/nvim ~/.config/nvim.old
```

- Install nvim setup 
```bash
git clone https://github.com/olexsmir/nvim ~/.config/nvim
```
