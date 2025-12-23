vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa-paper").setup({})
      vim.cmd.colorscheme("kanagawa-paper-ink")
    end,
  },
{
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
},
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },
{
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
    })
  end
},

  {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
  end,
},
{
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
  end,
},
{
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      direction = "float",
      float_opts = {
        border = "rounded",
      },
    })
  end,
},

{
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate'
},
{
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({})
      end,
},
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
})



-- TELESCOPE KEYMAPS
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Help" })

-- Git signs
local gs = require("gitsigns")
vim.keymap.set("n", "<leader>hn", gs.next_hunk, { desc = "Next hunk" })
vim.keymap.set("n", "<leader>hp", gs.prev_hunk, { desc = "Prev hunk" })

vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })

vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage" })

vim.keymap.set("n", "<leader>hb", gs.blame_line, { desc = "Blame line" })
vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })

-- Terminal
vim.keymap.set("n", "<leader>\\", ":ToggleTerm<CR>", { desc = "Terminal" })

vim.keymap.set(
  { "n", "t" },
  "<leader>\\",
  "<cmd>ToggleTerm<CR>",
  { desc = "Toggle terminal" }
)
vim.keymap.set(
  "n",
  "<leader>hg",
  "<cmd>LazyGit<CR>",
  { desc = "LazyGit" }
)
-- Open Oil in a right vertical split
vim.keymap.set("n", "<leader>p", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
  require("oil").open()
end, { desc = "Open Oil (right split)" })


vim.keymap.set("n", "<leader>P", require("oil").open, { desc = "Open Oil (current window)" })
vim.keymap.set("n", "<leader>fw", function()
  require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cword>") })
end, { desc = "Search word under cursor" })
