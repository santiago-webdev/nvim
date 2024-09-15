vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    -- local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- local methods = vim.lsp.protocol.Methods

    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<CR>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "K", function()
      return require("ufo").peekFoldedLinesUnderCursor() or vim.lsp.buf.hover()
    end)
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
  end,
})
