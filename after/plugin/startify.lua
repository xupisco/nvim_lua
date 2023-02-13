vim.g.startify_session_dir = '~/.config/nvim/.sessions'
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_session_persistence = 1
vim.g.startify_session_delete_buffers = 1

vim.g['startify_lists'] = {
    { type = 'sessions',  header = {'   Sessions'}                      },
    { type = 'bookmarks', header = {'   Bookmarks'}                     },
    { type = 'files',     header = {'   Files'}                         },
    { type = 'dir',       header = {('   Current Directory '..vim.fn.getcwd()) }},
}

vim.g['startify_bookmarks'] = {
    { i = '~/.config/nvim' },
    { p = '~/projects' },
}
