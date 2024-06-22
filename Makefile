HOME_DIR != getent passwd "$(USER)"| cut -d: -f6

.PHONY: install
install:
	git clone http://github.com/VundleVim/Vundle.vim.git $(HOME_DIR)/.vim/bundle/Vundle.vim
	ln -s $(HOME_DIR)/.vim/vimrc $(HOME_DIR)/.vimrc
	ln -s $(HOME_DIR)/.vim/gvimrc $(HOME_DIR)/.gvimrc
	vim +PluginInstall +qall
