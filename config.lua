-- move to ~/.config/lvim/config.lua
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = {
  {"folke/tokyonight.nvim"},
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
}
lvim.colorscheme = "tokyonight"

-- indentation
vim.opt.shiftwidth = 4
lvim.autocommands = {
  {
    {"BufEnter", "BufWinEnter"},
    {
      group = "lvim_user",
      pattern = "*.cpp,*.c,*.h",
      command = "setlocal ts=4 sw=4"
    }
  }
}

-- Formatter config, see formatter configuration https://clang.llvm.org/docs/ClangFormatStyleOptions.html#configurable-format-style-options
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "clang-format",
    filetypes = { "cpp", "c" },
    extra_args = { "--style", "WebKit" }
  }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = 'utf-8'
require('lspconfig').clangd.setup{
        capabilities = capabilities
}

-- map 'sT' for search cursor word
function GrepInputString()
  local default = vim.api.nvim_eval([[expand("<cword>")]])
  require("telescope.builtin").grep_string({ default_text = default })
end
lvim.builtin.which_key.mappings["sT"] = { "<cmd>lua GrepInputString()<CR>", "Text under cursor" }
