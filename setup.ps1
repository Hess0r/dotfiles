# Copy-Item -Path ./vim/vimrc_windows -Destination $home/_vimrc
# Copy-Item -Path ./vim/gvimrc -Destination $home/_gvimrc
New-Item -Path $home/_gvimrc -ItemType SymbolicLink -Value ./vim/gvimrc 
