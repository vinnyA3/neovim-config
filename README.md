:rocket: Neovim Lua Configuration
==========

My Neovim driver.  Things are mostly setup for JavaScript development, as that's what I'm doing on
the daily, but this config is always a *WIP* :smile:.  I'll be adding things to faciliate working
with Rust, Lua .. etc!


### Configuration Directory Structure

```javascript
nvim
├── README.md
├── init.lua // entry point 
├── lua
│   ├── core
│   │   ├── keybindings.lua // main bindings--no plugin dependencies
│   │   └── options.lua // global, window, buffer options
│   ├── lsp
│   │   └── init.lua // nvim-config for LSP servers
│   └── plugins
│       ├── config.lua // config and keybindings for installed plugins
│       └── init.lua // packer.nvim with plugin initialization
└── legacy
    └── init.vim // deprecated vim entry 
```

I don't have many custom plugin modifications, so all third-party config exists
in a single file: `/lua/plugins/config.lua`
