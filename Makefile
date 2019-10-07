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

TAGS = TODO|FIXME|CHANGED|XXX|REVIEW|BUG|REFACTOR|IDEA|NOTE|WARNING

# Tasks
# -----

help: ## Show this message.

	@echo "usage: make [task]" \
	&& echo "available tasks:" \
	&& awk \
		'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / \
		{printf "$(CYAN)%-8s$(WHITE) : %s\n", $$1, $$2}' $(MAKEFILE_LIST)

link: ## Create symlinks for all files in $HOME.

	@for f in $$(find $(FIND_PATTERN) -exec readlink -f {} \;); \
		do ln -sfT $$f $(USER_HOME)/$$(basename $$f); \
	done

clean: ## Remove all symlinks from $HOME.

	@for f in $$(find $(FIND_PATTERN) -exec basename {} \;); \
		do rm -rf $(USER_HOME)/$$f; \
	done

.PHONY: todo-max-length
todo-max-length:  # Return the length of the longest tag name.

	@$(eval TODO_MAX_LENGTH := $(shell \
		echo '$(TAGS)' \
		| sed -e 's/|/\n/g' \
		| sort -u \
		| awk '{print length}' \
		| sort -nr \
		| head -1 \
	))

.PHONY: todo
todo: todo-max-length ## Show todos.

	@find $(code) \
		-type f \
		-not -path "./.git/*" \
		-exec \
			awk '/[ ]($(TAGS)):/ \
				{ \
					gsub("# ", "", $$0); \
					gsub("// ", "", $$0); \
					gsub("<!--", "", $$0); gsub("-->", "", $$0); \
					gsub("\"", "", $$0); \
					gsub(/\.\./, "", $$0); \
					gsub(/^[ \t]+/, "", $$0); \
					gsub(/:/, "", $$0); \
					gsub(/\.\//, "", FILENAME); \
					TYPE = $$1; $$1 = ""; \
					MESSAGE = $$0; \
					LINE = NR; \
					printf \
						"$(CYAN)%-$(TODO_MAX_LENGTH)s|$(WHITE):"\
						"%s|: $(CYAN)%s$(WHITE)($(BLUE)%s$(WHITE))\n" \
						, TYPE, MESSAGE, FILENAME, LINE \
				}' \
		{} \; | column -s '|' -t