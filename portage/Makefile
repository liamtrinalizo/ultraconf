LN = ln -sfv

all:
ifeq ($(shell id -u), 0)
	@echo -e "\e[36mInstalling Postage conf\e[m"
	@for file in $(shell ls); do \
		[ "$$(stat -c '%u %g %a' $$file)" = "0 0 644" ] && echo -e "\e[31mWrong file permission\e[m" && break; \
		echo  $(CURDIR)/$$file /etc/portage/$$file; \
	done
else
	@echo -e "\e[31mShould be run as root\e[m"
endif
