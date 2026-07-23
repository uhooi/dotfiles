.PHONY: vim-mac
vim-mac:
	sh ./make-vim-mac.sh

.PHONY: nvim
nvim:
	sh ./make-nvim.sh

.PHONY: clean-nvim
clean-nvim:
	sh ./clean-nvim.sh
