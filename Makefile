THEME = themes/robs-theme-color-theme.json

.PHONY: all validate format check-format package

all: validate format

validate:
	jq empty $(THEME) && @echo "JSON valid"

format:
	npx --yes prettier --write $(THEME) **/*.md *.yml *.yaml

check-format:
	npx --yes prettier --check $(THEME) **/*.md *.yml *.yaml

package:
	npx --yes @vscode/vsce package --allow-missing-repository

install: package
	code --install-extension robs-theme-*.vsix
