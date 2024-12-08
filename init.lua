-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
    -- stylua: ignore
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
                   lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
    -- stylua: ignore
    vim.api.nvim_echo({{("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg"},
                       {"Press any key to exit...", "MoreMsg"}}, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
end

require "lazy_setup"
require "polish"

require("aerial").setup({
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", {
            buffer = bufnr
        })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", {
            buffer = bufnr
        })
    end
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
