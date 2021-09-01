LN = ln -svf
MKDIR = mkdir -p

all: zsh vim
	@echo -e "\e[36mLink dotfiles\e[m"
	@find . -type f -not -name .zprofile -not -name Makefile -exec zsh -c '\
	    $(MKDIR) $(XDG_CONFIG_HOME)/$$(dirname {}); \
	    rm $(XDG_CONFIG_HOME)/{}; \
	    $(LN) $(CURDIR)/{} ${XDG_CONFIG_HOME}/{}  \
	' \;

zsh:
	@echo -e "\e[36mLink and source profile variables\e[m"
	@$(MKDIR) $(XDG_CACHE_HOME)/zsh
	@$(LN) $(CURDIR)/.zprofile $(HOME)
	@$(HOME)/.zprofile

vim: zsh
	@echo -e "\e[36mMake Vim directories\e[m"
	@$(MKDIR) -p $(XDG_CONFIG_HOME)/vim/{spell,syntax} $(XDG_DATA_HOME)/{vim/undo,vim/swap,vim/backup,vim/view}

.PHONY: all zsh vim
