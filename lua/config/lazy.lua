local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require("dap").adapters.lldb = {
  type = "executable",
  command = "/opt/homebrew/opt/llvm/bin/lldb-dap", -- adjust as needed
  name = "lldb",
}

local lldb = {
  name = "Launch lldb",
  type = "lldb", -- matches the adapter
  request = "launch", -- could also attach to a currently running process
  program = function()
    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  end,
  cwd = "${workspaceFolder}",
  stopOnEntry = false,
  args = {},
  runInTerminal = true,
}

require("dap").configurations.rust = {
  lldb, -- different debuggers or more configurations can be used here
}
require("dap").configurations.cpp = {
  lldb,
}

require("dap").configurations.c = {
  lldb,
}

--require("dap-python").setup("/Users/ghms/.virtualenvs/debugpy/bin/python")

require("dapui").setup({
  controls = {
    element = "repl",
    enabled = true,
    icons = {
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = "",
    },
  },
  element_mappings = {},
  expand_lines = true,
  floating = {
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  force_buffers = true,
  icons = {
    collapsed = "",
    current_frame = "",
    expanded = "",
  },
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.4,
        },
        {
          id = "breakpoints",
          size = 0.2,
        },
        {
          id = "stacks",
          size = 0.2,
        },
        {
          id = "watches",
          size = 0.2,
        },
      },
      position = "left",
      size = 60,
    },
    {
      elements = {
        {
          id = "repl",
          size = 0.5,
        },
        {
          id = "console",
          size = 0.5,
        },
      },
      position = "bottom",
      size = 20,
    },
  },
  mappings = {
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t",
  },
  render = {
    indent = 1,
    max_value_lines = 100,
  },
})

--require("Comment").setup({
--  ---Add a space b/w comment and the line
--  padding = true,
--  ---Whether the cursor should stay at its position
--  sticky = true,
--  ---Lines to be ignored while (un)comment
--  ignore = nil,
--  ---LHS of toggle mappings in NORMAL mode
--  toggler = {
--    ---Line-comment toggle keymap
--    line = "gcc",
--    ---Block-comment toggle keymap
--    block = "gbc",
--  },
--  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
--  opleader = {
--    ---Line-comment keymap
--    line = "kc",
--    ---Block-comment keymap
--    block = "gk",
--  },
--  ---LHS of extra mappings
--  extra = {
--    ---Add comment on the line above
--    above = "gkO",
--    ---Add comment on the line below
--    below = "kco",
--    ---Add comment at the end of line
--    eol = "kcA",
--  },
--  ---Enable keybindings
--  ---NOTE: If given `false` then the plugin won't create any mappings
--  mappings = {
--    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
--    basic = true,
--    ---Extra mapping; `gco`, `gcO`, `gcA`
--    extra = true,
--  },
--  ---Function to call before (un)comment
--  pre_hook = nil,
--  ---Function to call after (un)comment
--  post_hook = nil,
--})
