local status, autoparis = pcall(require,'nvim-autopairs')
if (not status) then
  return
end

autoparis.setup{
  disable_type = {'TelescopePrompt', 'vim'}
}
