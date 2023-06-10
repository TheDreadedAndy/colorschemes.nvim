.PHONY: default all

default: all

all:
	[ ! -d "vim-colortemplate" ] && git clone https://github.com/lifepillar/vim-colortemplate || true
	cd vim-colortemplate && git pull
	for f in colortemplate/*.colortemplate; do\
		if ! grep -q "Neovim: yes" $$f; then\
			echo "Neovim: yes" | cat - $$f > tmp && mv tmp $$f;\
		fi;\
	done
	command vim colortemplate/blue.vim --cmd "set rtp-=~/.vim"\
		--cmd "set rtp-=~/.vim/after"\
		--cmd "set rtp^=./vim-colortemplate"\
		--cmd "set rtp+=./vim-colortemplate/after"\
		'+set filetype=colortemplate' '+ColortemplateAll!' +qa
