# Neovim config

Those are my Neovim dotfiles. 99% of `Issues` will be ignored.

## Install Neovim

```sh
sudo pacman -S neovim
```

## Dependencies

### Required

*Essential dependencies* for running this config.

- **Git**
    ```sh
    sudo pacman -S git
    ```
- **Lua v5.1**
    ```sh
    sudo pacman -S lua51
    ```
- **LuaJIT**
    ```sh
    sudo pacman -S luajit
    ```
- **Luarocks**
    ```sh
    sudo pacman -S luarocks
    ```

### Recommended

*Highly recommended dependencies* generally **performance** related tools.

- **Treesitter**
    ```sh
    sudo pacman -S tree-sitter-cli
    ```
- **Ripgrep** (faster `grep`):
    ```sh
    sudo pacman -S ripgrep
    ```

### Optional

*Optional dependencies* usually for the respective **Language Servers**.

- **(NodeJS)[https://nodejs.org/]** (Optional) via (Node Version Manager (NVM))[https://github.com/nvm-sh/nvm]:
    ```sh
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    # or
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    ```
- **(Go - Golang CLI)[https://go.dev/dl/]** (Optional - for gopls):
    ```sh
    sudo pacman -S go
    ```

