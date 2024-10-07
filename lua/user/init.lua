local M = {}

require("user.notify-send")

function M.keymaps()
  vim.g.mapleader = ";" -- vim.keycode('<Space>')
  vim.g.localmapleader = vim.g.mapleader

  -- Disable unused keys for normal mode
  vim
    .iter({
      "<Space>",
      "<Down>",
      "<Up>",
      "<Left>",
      "<Right>",
      "<Backspace",
      "<Enter>",
    })
    :map(function(v)
      return vim.keymap.set("n", v, "<Nop>")
    end)

  -- Move line blacks of any visual selection around
  vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
  vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

  -- Keep the visual selection after using < or > motions
  vim.keymap.set("v", ">", ">gv")
  vim.keymap.set("v", "<", "<gv")

  vim.keymap.set("n", "<Leader>mm", vim.cmd.marks) -- Gets superseeded by Telescope mapping
  vim.keymap.set("n", "//", "/<Up>") -- UX improvement to quickly come back to the last thing you searched for

  vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
  vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)
  vim.keymap.set("n", "d<Tab>", vim.cmd.bdelete)

  -- To avoid using vim.opt.clipboard = "unnamedplus", and more comfortably working with the clipboard
  vim.keymap.set({ "n", "x", "o" }, "gy", '"+y', { desc = "Copy to clipboard" })
  vim.keymap.set({ "n", "x", "o" }, "gp", '"+p', { desc = "Paste clipboard text" })

  vim.keymap.set({ "n", "x", "o" }, "<C-l>", function()
    vim.opt.hlsearch = not vim.o.hlsearch and true
  end, { desc = "Extend the default <C-l> keybind to work as a toggle" })

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local opts = { buffer = args.buf, noremap = true, silent = true }
      -- local client = vim.lsp.get_client_by_id(args.data.client_id)
      -- local methods = vim.lsp.protocol.Methods

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "<CR>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "K", function()
        return require("ufo").peekFoldedLinesUnderCursor() or vim.lsp.buf.hover()
      end)
      vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<Leader>lh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
      end, { desc = "Toggle inlay hints" })
    end,
  })
end

function M.settings()
  vim.loader.enable()

  vim.g.var = "alpPrj"

  vim.opt.cpoptions:append({ n = true })
  vim.opt.fillchars:append({ eob = "␗" })
  vim.opt.listchars:append({
    tab = "» ",
    trail = "·",
    nbsp = "␣",
  })
  vim.opt.whichwrap:append({
    h = true,
    l = true,
    ["<"] = true,
    [">"] = true,
    ["~"] = true,
    ["["] = true,
    ["]"] = true,
  })

  -- This is embarrasing
  -- https://github.com/neovim/neovim/issues/20221
  -- And here the solution
  -- https://github.com/neovim/neovim/issues/18965
  vim.opt.laststatus = 0
  vim.opt.cmdheight = 0
  vim.opt.statusline = "%#Comment#" .. string.rep("─", vim.api.nvim_win_get_width(0)) .. "%*"

  vim.opt.ruler = false
  vim.opt.showcmd = false

  vim.opt.title = true
  vim.opt.titlestring = ""

  vim.opt.confirm = true
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.undofile = true
  vim.opt.list = true
  vim.opt.cursorline = true
  -- vim.opt.cursorcolumn = true
  vim.opt.cursorlineopt = "number" -- both
  vim.opt.splitright = true
  vim.opt.splitbelow = true
  vim.opt.termguicolors = true
  vim.opt.hlsearch = false -- if true, clear with <C-l>
  vim.opt.linebreak = true
  vim.opt.updatetime = 300
  vim.opt.timeoutlen = 600
  vim.opt.ttimeoutlen = 10
  -- vim.opt.clipboard = "unnamedplus" -- See keymaps
  vim.opt.mouse = "a"
  vim.opt.inccommand = "split"
  vim.opt.showbreak = "↪ "
  vim.opt.virtualedit = "all"
  vim.opt.scrolloff = 9999
  vim.opt.sidescrolloff = 999
  vim.opt.tabstop = 4
  vim.opt.shiftwidth = vim.o.tabstop
  vim.opt.shiftround = true
  vim.opt.signcolumn = "yes:1"
end

function M.color_settings()
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      vim.api.nvim_set_hl(0, "Cursor", { reverse = false })
      vim.api.nvim_set_hl(0, "Visual", { reverse = true })

      -- Remove background
      vim.api.nvim_set_hl(0, "Normal", {})
      vim.api.nvim_set_hl(0, "NormalNC", {})
      vim.api.nvim_set_hl(0, "EndOfBuffer", {})
    end,
  })
end

function M.autocmds()
  local dynamic_gutter_numbers = vim.api.nvim_create_augroup("DynamicGutterNumbers", { clear = false })

  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.api.nvim_create_autocmd("InsertLeave", {
    desc = "Dynamic gutter numbers, they change based on mode",
    group = dynamic_gutter_numbers,
    callback = function()
      vim.opt.relativenumber = true
    end,
  })

  vim.api.nvim_create_autocmd("InsertEnter", {
    desc = "Dynamic gutter numbers, they change based on mode",
    group = dynamic_gutter_numbers,
    callback = function()
      vim.opt.relativenumber = false
    end,
  })

  vim.opt.autowrite = true
  vim.opt.autowriteall = true
  vim.api.nvim_create_autocmd("FocusLost", {
    desc = "Write to the file when you unfocus neovim",
    group = dynamic_gutter_numbers,
    callback = function()
      vim.cmd("write")
    end,
  })

  vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Visual feedback when yanking text",
    group = vim.api.nvim_create_augroup("YankFeedback", { clear = false }),
    callback = function()
      vim.highlight.on_yank()
    end,
  })

  vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Remember cursor position",
    group = vim.api.nvim_create_augroup("RememberCursorPosition", { clear = false }),
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]],
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Before writing a file, create necessary directories if missing",
    group = vim.api.nvim_create_augroup("EnsureDirectoryStructure", { clear = false }),
    once = true,
    callback = function()
      vim.fn.mkdir(vim.fn.expand("%:p:h"), "p")
    end,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    once = true,
    desc = "Create missing dirs before writing. Same as `:write ++p` or from a shell `mkdir -p`",
    callback = function()
      vim.fn.mkdir(vim.fn.expand("%:p:h"), "p")
    end,
  })
end

function M.lsp_settings()
  local server_list = {
    "astro",
    "bashls",
    "cssls",
    "eslint",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    "pyright",
    "rust_analyzer",
    "svelte",
    "tailwindcss",
    "ts_ls",
    "yamlls",
  }

  local function on_attach(client, bufnr)
    if client.supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true)
    end
  end

  return server_list, on_attach
end

M.keymaps()
M.settings()
M.color_settings()
M.autocmds()

return M
