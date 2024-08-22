## About
![a demo of the plugin](demo.gif)

CursorShine.nvim helps keep track of cursor movement by briefly illuminating the cursor line and column upon cursor movement in normal mode. This is helpful as you can set a low contrast cursor line that doesn't grab your attention unless you need it to.

## How to install
**IMPORTANT** `require('cursorshine').setup()` must be called AFTER the colorscheme has been loaded. There are a number of ways to do this depending on how your configuration is structured. It might just be as easy as putting it lower down in the file, but I plan on providing some practical examples in the future.

for Lazy, I recommend making use of lazy loading on events, for eg
```lua
{
    "rlychrisg/cursorshine.nvim/",
        event = "CursorMoved", -- must be used to make sure colorscheme is loaded BEFORE hand
        config = function ()
            require('cursorshine').setup()
        end
}
```

## Configuration
To change the default options, just pass your own options to the table in `require('cursorshine').setup()`. To find your current cursorline bg colour, use the `:hi CursorLine` command, and paste it into a hex color picker to lighten, or darken.
```lua
require('cursorshine').setup({
        shine_line = '#263340', -- What color should the cursor line be
        shine_column = '#263340', -- What color should the cursor column be
        shine_duration = 1500 -- How long should the changes last (ms)
})
```

