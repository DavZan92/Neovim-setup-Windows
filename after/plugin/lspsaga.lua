local status, lspsaga = pcall(require, 'lspsaga')
if (not status) then
  return
end

lspsaga.init_lsp_saga{
  server_filetype_map = {}
}

local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'lf', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'lp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'lr', '<Cmd>Lspsaga rename<CR>', opts)

