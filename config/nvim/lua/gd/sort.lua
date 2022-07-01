-- This is a location where I have copied my older configs in and should be
-- sorted into appropriate sections.
--

-------------------- MAPPINGS ------------------------------
-- map('', '<leader>c', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
-- map('i', '<C-u>', '<C-g>u<C-u>')  -- Make <C-u> undo-friendly
-- map('i', '<C-w>', '<C-g>u<C-w>')  -- Make <C-w> undo-friendly

-- <Tab> to navigate the completion menu
-- map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
-- map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights
-- map('n', '<leader>o', 'm`o<Esc>``')  -- Insert a newline in normal mode



-------------- SPELLING --------------------------------------
-- Deprecated by using vale
-- require('spellsitter').setup{
--   hl = 'error',
-- }
-- -- set spell for markdown files only
-- cmd [[autocmd BufEnter *.md :set spell]]
