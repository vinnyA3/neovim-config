:rocket: Neovim Lua Configuration
==========

My Neovim driver.  Things are mostly setup for JavaScript development, as that's what I'm doing on
the daily, but this config is always a *WIP* :smile:.  I'll be adding things to faciliate working
with Rust, Lua .. etc!

## Table of Contents

* [Installation and Setup](installation-and-setup)
* [Configuration Directory Structure](configuration-directory-structure)
* [Plugins](Plugins)
* [LSP](LSP)

## Installation and Setup

Coming soon -- documentation

## Configuration Directory Structure

```javascript
nvim
  ├── README.md
  ├── init.lua // entry point
  ├── lua/
  │   ├── core/ // core options & default resets (no plugin dependencies)
  │   │   ├── disabled.lua
  │   │   ├── keybindings.lua
  │   │   └── options.lua
  │   ├── lsp/ // lsp centric config
  │   │   ├── README.md
  │   │   └── init.lua
  │   ├── plugins/ // various plugin config
  │   │   ├── autocompletion/
  │   │   │   └── init.lua
  │   │   ├── config.lua // subdirectory sourcing
  │   │   ├── cosmetic/
  │   │   │   └── init.lua
  │   │   ├── editing/
  │   │   │   └── init.lua
  │   │   ├── init.lua // plugin initialization (packer entry)
  │   │   ├── navigation/
  │   │   │   └── init.lua
  │   │   └── themes/
  │   │       └── init.lua
  │   └── utils.lua // misc, custom util module
  └── snippets // custom & community snippets
      ├── javascript
      │   ├── javascript.node.snippets
      │   ├── javascript-react.snippets
      │   └── javascript.snippets
      ├── typescriptreact.snippets
      └── typescript.snippets
```

## Plugins

Plugins are organized by use and context.  Please refer to each subdirectory
located in `/lug/plugins`.

## LSP

Coming soon -- documentation
