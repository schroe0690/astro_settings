-- lua/user/mappings.lua
local M = {}

-- バッファ関連
local function setup_buffers()
    -- バッファ移動
    vim.api.nvim_set_keymap('n', 'bh', ':bprev<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'bl', ':bnext<CR>', { noremap = true, silent = true })

    -- バッファ削除
    -- <leader>c で astronvim 独自のメソッドが呼び出されるので、これを使用すること
end

-- キーバインドの適用
function M.setup()
    setup_buffers()
end

return M
