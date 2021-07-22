local map = vim.api.nvim_set_keymap

map('n', '<Leader>nn', ':Fern -drawer .<CR>', { noremap = true })

map('n', '<buffer>', '<Plug>(fern-action-open) <Plug>(fern-action-open:select)')
map('n', '<buffer>', '<CR> <Plug>(fern-action-remove)')

