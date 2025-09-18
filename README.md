# Neovim Dotfiles

> [!NOTE]
> When referencing paths, I use some `$PLACEHOLDERS` which have different meanings.
> - `$NVIM_CONFIG` refers to the root of this repository
> - `$WORKSPACE` refers to a project workspace, which is generally where you open Neovim at

## .nvim-settings.lua

This file contains user-specific settings for my config.
The default settings and full spec can be found in `lua/core/options.lua`, but you can override them using this file.

It is mostly used for enabling plugins that require user-specific configuration (like sign-in) or additional dependencies.
By having a local config, you don't get flashed with a wall of errors when you first start Neovim.

I often find myself on machines where I don't have and need certains tools (say Ruby, Python, etc.)
which resulted in errors when starting Neovim. This way I keep everything off by default and only enable
what I really need.

This will result in the following order of loading, from lowest to highest priority:
1. `$NVIM_CONFIG/lua/core/options.lua` (default settings)
2. `$NVIM_CONFIG/.nvim-settings.lua` (user settings)
3. `$WORKSPACE/.nvim-settings.lua` (project settings, not yet implemented)

> [!IMPORTANT]
> I plan to make it possible to toggle these settings project-wise.
> Currently only user settings are supported.

