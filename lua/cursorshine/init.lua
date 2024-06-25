local M =  {}


-- function to get normal values
function Get_color(hl, atr)
    local fn = vim.fn
    return fn.synIDattr(fn.synIDtrans(fn.hlID(hl)), atr)
end


-- default config
M.config = {
    shine_line = "#263340",
    shine_column = "#263340",
    shine_duration = 1500,
}

function M.setup(opts)
    -- if different values are passed to user config, use those instead
    M.config = vim.tbl_deep_extend("force", M.config, opts or {})

    -- store normal bg values in variables
    _G.normal_line = Get_color("CursorLine", "bg#")
    _G.normal_col = Get_color("CursorColumn", "bg#")

    -- make the cursor bright upon moving
    vim.api.nvim_create_augroup("CursorShine", { clear = true })
    vim.api.nvim_create_autocmd("CursorMoved", { callback = function ()
        local line_bg = M.config.shine_line
        local col_bg = M.config.shine_column
        vim.api.nvim_set_hl(0, 'CursorLine', { bg = line_bg })
        vim.api.nvim_set_hl(0, 'CursorColumn', { bg = col_bg })
    end, group = "CursorShine" })

    -- return the colors to default
    local function StopCursorShine()
        vim.api.nvim_set_hl(0, 'CursorLine', { bg = normal_line })
        vim.api.nvim_set_hl(0, 'CursorColumn', { bg = normal_col })
    end

    -- wait a bit then turn the lights off
    local timer = vim.loop.new_timer()
    local shinedur = M.config.shine_duration
    timer:start(
        0,
        shinedur,
        vim.schedule_wrap(function()
            StopCursorShine()
        end)
    )

end

return M
