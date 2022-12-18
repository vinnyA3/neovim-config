:rocket: Neovim Lua Configuration
==========

My Neovim driver.  Things are mostly setup for JavaScript development, as that's what I'm doing on
the daily, but this config is always a *WIP* :smile:.  I'll be adding things to faciliate working
with Rust, Lua .. etc!

## Table of Contents

* [Installation and Setup](installation-and-setup)
* [Configuration Directory Structure](configuration-directory-structure)

## Installation and Setup

**Initial Steps**:
  * `git clone https://github.com/vinnyA3/neovim-config.git && cd neovim-config`
  * uncomment packer autoinstall method in `lua/vim/packer.lua`
  * open nvim - packer should autoinstall on launch
  * run `:PackerSync` -- note: you might need to close+reopen vim first before running
  * you're done!

**LSP Setup**: Refer to `after/lsp.lua` for the server configs.  Each config
requires a language server installed before usage.  This configuration leverages
[https://github.com/williamboman/mason.nvim](Mason.nvim) to install & manage MOST language servers -- Mason can be invoked
with `:Mason`.

> **note**: the eslint lang server is managed outside of mason - the extracted
> vscode langservers are not available in the mason registry (as of 12/17/22).
> The necessary language servers can be installed w/ `npm i -g vscode-langservers-extracted` or with `yarn`
> ... OR .. better yet, with volta: `volta install vscode-langservers-extracted`

**Treesitter**: Parsers are installed manually for now -- you just need to
`:TSInstall` for the desired parser.

## Configuration Directory Structure

```javascript
nvim
  ├── README.md
  ├── init.lua // entry point - source namespaced lua/vin
  ├── after
  │   └── plugins // houses all after-load plugin configurations
  ├── lua
  │   ├── vin/ // namespaced entry dir
  │   │   ├── init.lua // main entry
  │   │   ├── packer.lua // packer plugin sourcing
  │   │   ├── set.lua // default vim option settings
  │   │   ├── commands.lua // custom user au commands
  │   │   ├── utils.lua // helpers and utitlies for config usage
  │   │   └── remap.lua // main keybindings & remaps
  └── snippets // custom & community snippets
      ├── javascript
      │   ├── javascript.node.snippets
      │   ├── javascript-react.snippets
      │   └── javascript.snippets
      ├── typescriptreact.snippets
      └── typescript.snippets
```
