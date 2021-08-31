all: dotfiles scripts ebuilds portage manuals

dotfiles:
	@echo -e "\e[36mInstalling doftiles\e[m"
	$(MAKE) -C dotfiles

scripts:
	@echo -e "\e[36mInstalling scripts\e[m"
	$(MAKE) -C scripts

manuals:
	@echo -e "\e[36mInstalling manuals\e[m"
	$(MAKE) -C manuals

ebuilds:
	@echo -e "\e[36mInstalling ebuilds\e[m"
	$(MAKE) -C ebuilds

ebuilds_get:
	@echo -e "\e[36mUpdate ultraconf ebuilds with systems\e[m"
	$(MAKE) -C ebuilds ebuilds_get

portage:
	@echo -e "\e[36mInstalling Postage conf\e[m"
	$(MAKE) -C portage

.PHONY: all scripts manuals ebuilds ebuilds_get portage
