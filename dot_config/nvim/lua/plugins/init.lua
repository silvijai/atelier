return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
      require("catppuccin").setup({})
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  { "nvim-tree/nvim-web-devicons", config = function()
    require("nvim-web-devicons").setup({})
  end },

  { "hrsh7th/nvim-cmp", config = function()
    require("cmp").setup({})
  end },

  { "folke/which-key.nvim", config = function()
    require("which-key").setup({})
  end },

  { "nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      ts.install({ "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" }):wait(30000)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function(event)
          local lang = event.match
          local ok = pcall(vim.treesitter.start, event.buf, lang)
          if not ok then return end
        end,
      })
    end },

  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end },

  { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          filtered_items = { hide_dotfiles = false, visible = true },
          follow_current_file = { enabled = true },
        },
        window = { mappings = { ["<space>"] = "none" }, position = "left", width = 30 },
      })
    end },

  { "nvim-lualine/lualine.nvim", config = function()
    require("lualine").setup({})
  end },

  { "mfussenegger/nvim-lint", config = function()
    require("lint").linters_by_ft = {
      c = { "cppcheck" },
      cpp = { "cppcheck" },
      javascript = { "eslint" },
      python = { "ruff" },
      typescript = { "eslint" },
    }
    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function() require("lint").try_lint() end,
    })
  end },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", config = function()
    require("ibl").setup({})
  end },

  { "lewis6991/gitsigns.nvim", config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        changedelete = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
      },
    })
  end },

  { "folke/flash.nvim", config = function()
    require("flash").setup({})
  end },

  { "stevearc/conform.nvim", config = function()
    require("conform").setup({
      format_on_save = { lsp_format = "fallback", timeout_ms = 1000 },
      formatters_by_ft = {
        javascript = { "prettier" },
        python = { "black" },
        rust = { "rustfmt" },
        typescript = { "prettier" },
      },
    })
  end },

  { "numToStr/Comment.nvim", config = function()
    require("Comment").setup({})
  end },
}
