LN = ln -sfv
MKDIR = mkdir -p
MANPATH = /usr/share/man/man7

all:
ifeq ($(shell id -u), 0)
	@$(MKDIR) $(MANPATH)
	@for file in $(shell ls *.7); do \
		$(LN) $(CURDIR)/$$file $(MANPATH)/$$file; \
	done
else
	@echo -e "\e[31mShould be run as root\e[m"
endif
