all:
ifeq ($(shell id -u), 0)
	@echo -e "\e[36mInstalling custom ebuilds\e[m"
	@cp -r ebuilds/* /var/db/repos/perso/
	@eix-sync -a
else
	@echo -e "\e[31mShould be run as root\e[m"
endif

ebuilds_get:
	@rm -r ebuilds/*
	@rsync -av  --exclude 'Manifest' /var/db/repos/perso/ ebuilds

.PHONY: all ebuilds_get
