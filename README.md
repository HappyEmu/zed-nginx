# zed-nginx

A [Zed](https://zed.dev) extension providing syntax highlighting for nginx configuration files.

## Features

- Tree-sitter based parsing via [tree-sitter-nginx](https://github.com/HappyEmu/tree-sitter-nginx)
- Keyword highlighting for structural directives (`server`, `location`, `http`, `events`, `upstream`, etc.)
- Distinct highlighting for boolean literals (`on`/`off`, `true`/`false`, `yes`/`no`)
- Variables, strings, numbers, IPs, comments, regex
- Lua block support (OpenResty)

## File associations

- `*.conf`
- `nginx.conf`

## Installation

### From source (dev extension)

1. Clone this repo
2. In Zed, open the Extensions panel
3. Click **Install Dev Extension**
4. Select the cloned directory

## Changes from upstream

### tree-sitter-nginx grammar ([fork](https://github.com/HappyEmu/tree-sitter-nginx))

- Fixed `generic` regex to include dots in the trailing character class, so paths like `/usr/bin/ruby2.7` parse as a single token instead of splitting at the dot.

### highlights.scm (adapted from [zed-extensions/nginx](https://github.com/zed-extensions/nginx))

- Structural block directives (`server`, `location`, `http`, `events`, `upstream`, `stream`, `mail`, `map`, `geo`, `types`, `if`, `limit_except`) highlighted as keywords instead of generic functions.
- Common simple directives (`listen`, `include`, `return`, `rewrite`, `set`, `try_files`) highlighted as keywords.
- Boolean literals (`on`/`off`, `true`/`false`, `yes`/`no`) highlighted as `@boolean` instead of `@string`.
- Fixed query precedence so specific highlight rules take effect over generic fallbacks (tree-sitter uses last-match-wins).

## Acknowledgements

This extension is built on the work of others:

- **Jonathan Coole** — author of the original [tree-sitter-nginx](https://gitlab.com/joncoole/tree-sitter-nginx) grammar that powers the parsing in this extension. The grammar is forked at [HappyEmu/tree-sitter-nginx](https://github.com/HappyEmu/tree-sitter-nginx) with minor fixes. Licensed under GPLv3.

- **d1y (chenhonzhou)** — author of the official [zed-extensions/nginx](https://github.com/zed-extensions/nginx) Zed extension, from which the `highlights.scm` queries were adapted. Licensed under Apache 2.0.

## License

Apache 2.0 — see [LICENSE](LICENSE) and [NOTICE](NOTICE).
