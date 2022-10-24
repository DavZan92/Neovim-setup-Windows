local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

-- PYTHON --
nvim_lsp.pyright.setup {
  on_attach = on_attach,
  filetypes = { "python" },
  single_file_support = true,
}

-- LUA --
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
  cmd = { "lua-language-server" },
}

-- CLANGD --
nvim_lsp.clangd.setup {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  root_dir = nvim_lsp.util.root_pattern('.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git'),
  single_file_support = true
}


-- CMAKE --
--nvim_lsp.cmake.setup {
--  on_attach = on_attach,
--  cmd = { "cmake-language-server" },
--  filetypes = { 'cmake' },
--}
