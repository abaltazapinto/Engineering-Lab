" Optional Markdown clipboard mapping; requires an inspected img-paste.vim installation.
" Source: abaltazapinto/scripts at c367a2fbef46eec94f16277a1c8e8bd4c2fda822, AGENTE/vim/VIM.md.
" Uses the user's existing leader and does not replace the rest of vimrc.
augroup engineering_lab_markdown_images
  autocmd!
  autocmd FileType markdown nnoremap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
augroup END
