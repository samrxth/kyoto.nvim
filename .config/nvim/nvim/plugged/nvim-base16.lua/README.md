## base16.lua

Programmatic lua library for setting
[base16](https://github.com/chriskempson/base16) themes in
[Neovim](https://github.com/neovim/neovim).

## Demo

```lua
local theme_names = base16.theme_names()
base16_position = 1
function cycle_theme()
  base16_position = (base16_position % #theme_names) + 1
  base16(base16.themes[theme_names[base16_position]], true)
end
```

![Cycle themes](https://raw.githubusercontent.com/norcalli/github-assets/master/nvim-base16.lua-demo.webm)

## Usage

Install via your plugin manager. e.g.

```vim
Plug "norcalli/nvim-base16.lua"
```

### Basic usage

```lua
lua << EOF
local base16 = require 'base16'
base16(base16.themes.brewer, true)
EOF
```

This is how I use it. Uses [`norcalli/nvim.lua`](https://github.com/norcalli/nvim.lua).

```lua
lua << EOF
nvim = require 'nvim'
local base16 = require 'base16'
base16(base16.themes[nvim.env.BASE16_THEME or "3024"], true)
EOF
```

You can define your own themes and use them with the `base16` function as long
as they match the format described below. I know the format is annoying to
define, so the `base16.theme_from_array` utility function is available.

## API

### base16.apply_theme(theme_definition: dict, use_256_colorspace: bool)
### base16(theme_definition: dict, use_256_colorspace: bool)

Alias for `base16.apply_theme(theme_definition: dict, use_256_colorspace: bool)`.

Example:

```lua
base16(base16.themes["brewer"], true)
```


### base16.theme_names() -> string

Return a list of all available theme names. Shortcut for fetching the keys from `base16.themes`.

Example:

```lua
print(vim.inspect(base16.theme_names()))
```

### base16.theme_from_array(theme_definition: array) -> dict

Formats an array of 16 hex color strings into a dictionary suitable for use
with `base16.apply_theme`.

Example:

```lua
local theme = base16.theme_from_array {
	"383838"; "404040"; "606060"; "6f6f6f";
	"808080"; "dcdccc"; "c0c0c0"; "ffffff";
	"dca3a3"; "dfaf8f"; "e0cf9f"; "5f7f5f";
	"93e0e3"; "7cb8bb"; "dc8cc3"; "000000";
}
base16(theme, true)
```

## Variables

### base16.themes

Dictionary of definitions to be used by `base16` or `base16.apply_theme`.

Example:

```lua
base16.themes["zenburn"] == {
	base00 = "383838"; base01 = "404040"; base02 = "606060"; base03 = "6f6f6f";
	base04 = "808080"; base05 = "dcdccc"; base06 = "c0c0c0"; base07 = "ffffff";
	base08 = "dca3a3"; base09 = "dfaf8f"; base0A = "e0cf9f"; base0B = "5f7f5f";
	base0C = "93e0e3"; base0D = "7cb8bb"; base0E = "dc8cc3"; base0F = "000000";
}
```

## Notes

Because this includes a copy of
[`norcalli/nvim.lua`](https://github.com/norcalli/nvim.lua), you should put
this after `norcalli/nvim.lua` in the plugin list because lua module resolution
is first-come-first-served, i.e.

```vim
Plug "norcalli/nvim.lua"
Plug "norcalli/nvim-base16.lua"
```

## Credits

Chris Kempson and [Base16](https://github.com/chriskempson/base16) and [base16-vim](https://github.com/chriskempson/base16-vim)
