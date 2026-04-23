return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local keymap = vim.keymap.set
        local function opts(desc)
          return { buffer = ev.buf, silent = true, desc = desc }
        end

        local mappings = {
          { "n", "gr", "<cmd>Telescope lsp_references<CR>", "Show LSP references" },
          { "n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions" },
          { "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions" },
          { "n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations" },
          { "n", "gc", "<cmd>Telescope lsp_incoming_calls<CR>", "Show LSP incoming calls" },
          { "n", "gC", "<cmd>Telescope lsp_outgoing_calls<CR>", "Show LSP outgoing calls" },
          { "n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", "Show LSP document symbols" },
          { "n", "gS", "<cmd>Telescope lsp_workspace_symbols<CR>", "Show LSP workspace symbols" },
          { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "See available code actions" },
          { "n", "<leader>rn", vim.lsp.buf.rename, "Smart rename" },
          { "n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics" },
          { "n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics" },
          { "n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic" },
          { "n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic" },
          { "n", "K", vim.lsp.buf.hover, "Show documentation" },
          { { "n", "i" }, "<C-f>", vim.lsp.buf.signature_help, "Show signature help" },
        }

        for _, m in ipairs(mappings) do
          keymap(m[1], m[2], m[3], opts(m[4]))
        end
      end,
    })
  end,
}
