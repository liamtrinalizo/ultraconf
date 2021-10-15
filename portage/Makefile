LN = ln -sfv

#TODO world file

all:
ifeq ($(shell id -u), 0)
	@echo -e "\e[36mInstalling Postage config\e[m"
	@for file in $(shell find . -maxdepth 1 -type f); do \
		[ "$$(stat -c '%u %g %a' $$file)" = "0 0 644" ] && echo -e "\e[31mWrong file permission\e[m" && break; \
		cp $(CURDIR)/$$file /etc/portage/$$file; \
	done

	@echo -e "\e[36mInstalling Postage patches\e[m"
	cp -r $(CURDIR)/patches /etc/portage/patches
else
	@echo -e "\e[31mShould be run as root\e[m"
endif
