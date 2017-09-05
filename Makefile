# Dotfiles helper Makefile
# ------------------------
# '||:' is a shortcut to '|| true' to avoid the
# 'make: [target] Error 1 (ignored)' warning message.

# Switch to bash instead of sh
SHELL := /bin/bash

# Colors.
WHITE  = \033[0m
RED    = \033[31m
GREEN  = \033[32m
YELLOW = \033[33m
BLUE   = \033[34m
CYAN   = \033[36m

FIND_PATTERN = . ! -path "./.git" ! -path "." -name ".*"
USER_HOME ?= $$HOME

# Tasks
# -----

help: ## Show this message.

	@echo "usage: make [task]" \
	&& echo "available tasks:" \
	&& awk \
		'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / \
		{printf "$(CYAN)%-8s$(WHITE) : %s\n", $$1, $$2}' $(MAKEFILE_LIST)

link: ## Create symlink for all files in $HOME.

	@for f in `find $(FIND_PATTERN) -exec readlink -f {} \;`; \
		do ln -sfT $$f $(USER_HOME)/$$(basename $$f); \
	done

clean: ## Remove  all symlink from $HOME.

	@for f in `find $(FIND_PATTERN) -exec basename {} \;`; \
		do rm -rf $(USER_HOME)/$$f; \
	done
