vim.cmd.packadd('nvim-treesitter')

local ok, _ = pcall(function()
    require('nvim-treesitter.config').setup({
        ensure_installed = {},
        auto_install = true,
        highlight = {
            enable = true,
            disable = function(_, buf)
                local bufname = vim.api.nvim_buf_get_name(buf)
                return bufname:match('/vendor/') ~= nil
                    or bufname:match('/node_modules/') ~= nil
            end,
        },
        indent = { enable = true },
    })
end)

if not ok then
    vim.notify('nvim-treesitter not yet installed. Restart after vim.pack.add() downloads it.', vim.log.levels.WARN)
end

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = '*.blade.php',
    callback = function()
        vim.bo.filetype = 'blade'
    end,
})
