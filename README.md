# Neovim Configuration

This README documents the structure and components of your Neovim configuration.

## Structure

### Core Settings
- **`lua/core/options.lua`**: General Neovim options and settings.
- **`lua/core/keymaps.lua`**: Key mappings defined for normal and insert modes.
- **`lua/core/diagnostics.lua`**: Configure LSP diagnostics messages and presentation.
- **`lua/core/autocmds.lua`**: Automatic commands triggered by file events.

### Plugins
- **`lua/core/plugins/lsp.lua`**: Language Server Protocol settings for coding assistance.
- **`lua/plugins` Folder**: Third-party plugins with their specific setups, such as `snacks`, `mini`, etc.

## How to Use
- Clone your Neovim configuration repository.
- Place files in the appropriate directories as per the structure above.
- Update dependencies (e.g., `:PackerSync`) to ensure proper plugin loading.

## Key Highlights
- Modular file structure for clarity.
- Descriptive comments in every Lua file for faster understanding.
- Logical grouping of related functions.

Enjoy your well-structured Neovim configuration for better maintenance and usage!

