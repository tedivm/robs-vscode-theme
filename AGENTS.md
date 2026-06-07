# AGENTS.md

## Project overview

A VS Code dark color theme based on [Rob's Style Guide](https://tedivm.github.io/robs-style-guide/). Deep purple backgrounds with pink, purple, and cyan accents.

- **Theme file:** `themes/robs-theme-color-theme.json`
- **Manifest:** `package.json`

This is a data-only project — no source code, no build system, no tests.

## How it works

The theme is a single JSON file with two top-level keys:

- `colors` — UI color mappings (VS Code theme color properties → hex values)
- `tokenColors` — TextMate syntax token scopes (array of `{scope, settings}` objects)

VS Code reads the file directly from the path defined in `package.json.contributes.themes[0].path`.

## Palette

All colors derive from Rob's Style Guide tokens:

| Token              | Hex       |
| ------------------ | --------- |
| Background         | `#1a1025` |
| Surface            | `#2d1b4e` |
| Code / Inputs      | `#0f0a1a` |
| Borders            | `#3d2b5a` |
| Foreground         | `#dcdcdc` |
| Muted              | `#b4b4b4` |
| Dim                | `#999`    |
| Primary (pink)     | `#de38a8` |
| Secondary (purple) | `#b96dff` |
| Accent (cyan)      | `#01cdfe` |
| Success (green)    | `#50c878` |
| Warning (amber)    | `#ffbe32` |
| Error (red)        | `#ff5050` |

Transparency is encoded as 2-digit hex alpha suffixes: `20` (~12%), `30` (~19%), `4d` (~30%), `50` (~31%), `66` (~40%), `7e` (~49%), `80` (50%), `99` (~60%), `b8` (~72%), `cc` (80%).

## Makefile

| Target              | Description                                                  |
| ------------------- | ------------------------------------------------------------ |
| `make validate`     | Validates JSON syntax with `jq`                              |
| `make format`       | Formats theme JSON with Prettier                             |
| `make check-format` | Dry-run Prettier check (for CI)                              |
| `make package`      | Packages extension into `.vsix`                              |
| `make install`      | Packages and installs locally via `code --install-extension` |
| `make`              | Runs `validate` and `format`                                 |

## Validation

There is no linter or test runner. To validate the theme:

1. Run `make validate` to check JSON syntax
2. Open this folder in VS Code
3. Check the Problems panel for theme color validation errors (invalid properties, missing transparency, malformed hex)

## Conventions

- Theme properties use VS Code's canonical naming (camelCase, e.g., `settings.checkboxBackground`, not `settings.checkbox.background`)
- Properties marked `mustBeTransparent` by VS Code always have a non-zero alpha suffix
- No comments in the JSON file
- `tmp/design.md` is the source of truth for pending changes — read it before making edits
- `tmp/` is gitignored; do not commit files there
