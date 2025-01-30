-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.colorscheme = "lunar"

vim.opt.cursorcolumn = true

lvim.plugins = {
  {"joshdick/onedark.vim"},
  {"brentyi/isort.vim"},
  {"mhinz/vim-signify"},
  {"junegunn/fzf"},
  {"AlexVKO/fzf-to-functions.vim"},
  {"averms/black-nvim"},
  {"cappyzawa/trim.nvim"},
}

-- Mapping
lvim.keys.normal_mode["<C-o>"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<C-g>"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<C-t>"] = ":ToggleTerm<CR>"
lvim.keys.normal_mode["<C-f>"] = ":FzfMethods<CR>"


-- ColorScheme override
local c = require('lunar.palette')
lvim.autocommands = {
  {
    { "ColorScheme" },
    {
      pattern = "*",
      callback = function()

        -- Use terminal background color
        vim.api.nvim_set_hl(0, "Normal", { bg = 'None' })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = 'None' })
        vim.api.nvim_set_hl(0, "NormalSB", { bg = 'None' })

        vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = 'None' })
        vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = 'None' })
        vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = 'None' })

        vim.api.nvim_set_hl(0, "DiffAdd", { bg = 'None' })
        vim.api.nvim_set_hl(0, "DiffChange", { bg = 'None' })
        vim.api.nvim_set_hl(0, "DiffDelete", { bg = 'None' })

        vim.api.nvim_set_hl(0, "SignColumn", { bg = 'None' })
        vim.api.nvim_set_hl(0, "SignColumnSB", { bg = 'None' })

        vim.api.nvim_set_hl(0, "Include", { fg = c.purple })
        vim.api.nvim_set_hl(0, "Constant", { fg = c.fg })

        vim.api.nvim_set_hl(0, "ColorColumn", { fg = 'None', bg = '#292e42' })
      end,
    },
  },
}

require('trim').setup({
  ft_blocklist = {},
  patterns = {},
  trim_on_write = true,
  trim_trailing = true,
  trim_last_line = true,
  trim_first_line = true,
})

-- Python
local null_ls = require("null-ls")
null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.diagnostics.mypy,
  },
}

require('lspconfig')['null-ls'].setup {}


lvim.keys.normal_mode["<Leader>o"] = "<CMD>Isort<CR>"

vim.cmd[[autocmd FileType python set colorcolumn=99]]
