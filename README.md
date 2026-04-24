This is a configuration file made for neovim on windows only.
It is intended for (but not limited to):

- Python
- C++
- C
- Markdown
- lua


It is required to have installed the following:
- node.js
- npm
- git
- lazygit
- pynvim (via pip install pynvim)

# Neovim Config — Guia de fitxers

> Configuració personal de Neovim per Windows, orientada a Python, C/C++, Lua i LaTeX.
> Colorscheme base: **tokyonight** amb overrides liles via `colorpalette.lua`.

---

## Dependències externes

Eines que cal tenir instal·lades al sistema per al funcionament complet de la config.

### Obligatòries
| Eina | Per a què | Instal·lació |
|------|-----------|--------------|
| **Neovim >= 0.11** | El propi editor | `winget install Neovim.Neovim` |
| **Git** | lazy.nvim i plugins | `winget install Git.Git` |
| **Node.js** | Alguns LSP i parsers | `winget install OpenJS.NodeJS` |
| **gcc / cc** | Compilar parsers de treesitter | Via MSYS2: `pacman -S mingw-w64-x86_64-gcc` |
| **Nerd Font** | Icones per tot arreu | Qualsevol font de https://www.nerdfonts.com |

### Per a Python
| Eina | Per a què | Instal·lació |
|------|-----------|--------------|
| **Python** | Entorn d'execució | https://www.python.org |
| **pyright** | LSP de Python | `pip install pyright` o via Mason (`:MasonInstall pyright`) |

### Per a C / C++
| Eina | Per a què | Instal·lació |
|------|-----------|--------------|
| **clangd** | LSP de C/C++ | Via Mason (`:MasonInstall clangd`) |
| **CMake** | cmake-tools.nvim | `winget install Kitware.CMake` |
| **clang-format** | Format de codi C/C++ | Inclòs amb clangd |

### Per a LaTeX
| Eina | Per a què | Instal·lació |
|------|-----------|--------------|
| **MiKTeX** | Compilació LaTeX | https://miktex.org/download |
| **Perl (Strawberry)** | latexmk (necessari per compilar) | https://strawberryperl.com |
| **SumatraPDF** | Visor de PDF | https://www.sumatrapdfreader.org |

### Opcionals però recomanats
| Eina | Per a què | Instal·lació |
|------|-----------|--------------|
| **lazygit** | UI de git (`<leader>gg`) | `winget install JesseDuffield.lazygit` |
| **ripgrep** | Telescope live grep (`<leader>sg`) | `winget install BurntSushi.ripgrep.MSVC` |
| **fd** | Telescope find files més ràpid | `winget install sharkdp.fd` |
| **Neovide** | Frontend GPU de Neovim | https://neovide.dev |

---

## `lua/config/` — Configuració base (sense plugins)

| Fitxer | Què fa |
|--------|--------|
| `options.lua` | Opcions globals de Neovim: números de línia, indentació, scroll, diagnòstics, colorcolumn dinàmica... |
| `keymaps.lua` | Tots els keymaps globals: navegació entre finestres, guardar, mode terminal, clipboard, comentaris... |
| `autocommands.lua` | Autocmds globals: highlight al yank, notificació al guardar, fix cursor color, guicursor per modes |
| `colorpalette.lua` | **Font única de tots els colors.** Canvia aquí si vols modificar qualsevol color de la config |
| `lazy.lua` | Inicialitza lazy.nvim (el gestor de plugins). Toca'l si vols canviar opcions de lazy |
| `neovide.lua` | Configuració específica de Neovide (cursor, animacions, fullscreen). Ignorat si no uses Neovide |
| `dashboard.lua` | Pantalla d'inici custom: logo, hora, bateria, uptime, directori i fitxers recents |

---

## `lua/plugins/` — Plugins

### Aparença i UI

| Fitxer | Què fa |
|--------|--------|
| `colors.lua` | Carrega tokyonight, sobreescriu colors floating windows i aplica tots els highlights liles via `VimEnter` |
| `statusline.lua` | Barra d'estat (lualine): mode, fitxer, branch, diagnòstics, LSP status, hora |
| `floatingcmd.lua` | Noice.nvim: substitueix la command line i missatges per finestres flotants. Configura signature help i colors |
| `todo-comments.lua` | Ressalta i navega comentaris especials: TODO, FIX, HACK, NOTE, WARN, PERF |
| `nvim-biscuits.lua` | Mostra el context del bloc al final de cada tancament (`}`, `end`...) en gris itàlic |
| `dropbar.lua` | Breadcrumb a la part superior que mostra on ets dins del fitxer (funció, classe...) |
| `colorizer.lua` | Mostra un quadrat de color al costat de cada codi hexadecimal al codi |
| `gitsigns.lua` | Indicadors de git al gutter: línies afegides, modificades i esborrades |

### Navegació i cerca

| Fitxer | Què fa |
|--------|--------|
| `telescope.lua` | Fuzzy finder: buscar fitxers, text, keymaps, buffers, diagnòstics... Keymaps `<leader>s*` |
| `flash.lua` | Salt ràpid a qualsevol lloc visible amb 2-3 tecles. `s` per saltar, `S` per treesitter |
| `harpoon.lua` | Marca fins a 4 fitxers i salta entre ells instantàniament. `<leader>ha`, `<leader>1-4` |
| `neo-tree.lua` | File explorer lateral amb git status, icones i preview. `<leader>e` |
| `aerial.lua` | Panell lateral amb tots els símbols del fitxer (funcions, classes...). `<leader>cf` |

### LSP, autocomplete i diagnòstics

| Fitxer | Què fa |
|--------|--------|
| `lsp-setup.lua` | Configura pyright (Python) i clangd (C/C++), capabilities, hover handler i keymaps LSP (`gd`, `gr`, `K`...) |
| `autocompletion.lua` | nvim-cmp: autocomplete amb LSP, snippets i paths. Ordenació intel·ligent i finestres liles |
| `clangd-extensions.lua` | Funcionalitats extra de clangd: inlay hints, jerarquia de tipus, memory usage. `<leader>ch` |
| `tiny-inline-diagnostic.lua` | Mostra els diagnòstics inline al costat del codi de manera més visual |
| `lazydev.lua` | Suport LSP complet per editar la config de Neovim en Lua (`vim.*` sense warnings) |

### Edició i format

| Fitxer | Què fa |
|--------|--------|
| `neogen.lua` | Genera docstrings automàticament. Google style per Python, Doxygen per C/C++. `<leader>nd/nf/nc` |
| `treesj.lua` | Split/join de blocs: expandeix o col·lapsa funcions, arrays, dicts en una o múltiples línies. `<leader>j*` |
| `mini-surround.lua` | Afegeix, esborra i reemplaça surroundings (`"`, `(`, `[`...). Prefix `gz` |
| `vim-visual-multi.lua` | Multi-cursor. `<C-n>` per seleccionar coincidències, `<leader>va` per seleccionar totes |
| `oneliners.lua` | guess-indent (detecta indentació automàticament) + nvim-autopairs (tanca parèntesis/cometes) |

### Git

| Fitxer | Què fa |
|--------|--------|
| `lazygit.lua` | Obre lazygit en una finestra flotant. `<leader>gg` |

### Terminal

| Fitxer | Què fa |
|--------|--------|
| `toggleterm.lua` | Terminal flotant persistent. `<C-t>` per obrir/tancar, `<leader>t1/t2/t3` per terminals múltiples |

### Treesitter

| Fitxer | Què fa |
|--------|--------|
| `treesitter.lua` | Syntax highlighting, indentació i text objects via treesitter. Conté els parsers instal·lats i incremental selection |

### Llenguatges específics

| Fitxer | Què fa |
|--------|--------|
| `cmake-tools.lua` | Integra CMake: configure, build, run, debug. `<leader>m*`. Necessita `CMakeLists.txt` a l'arrel |
| `latex.lua` | vimtex + cmp-vimtex: syntax highlighting, autocomplete LaTeX i compilació amb latexmk + SumatraPDF. `<leader>l*` |
| `markdown.lua` | render-markdown.nvim: renderitza markdown inline amb colors liles. `<leader>tr` per toggle |
| `rainbowCSV.lua` | Pinta cada columna d'un color diferent en fitxers CSV/TSV. `<leader>ca` per alinear columnes |

### Altres

| Fitxer | Què fa |
|--------|--------|
| `telescope.lua` | Vegeu "Navegació i cerca" |
| `which-key.lua` | Mostra els keymaps disponibles quan esperes després d'un prefix (`<leader>`...) |

---

## On anar si vols canviar...

| Vull canviar... | Fitxer |
|-----------------|--------|
| Un color qualsevol | `lua/config/colorpalette.lua` |
| El colorscheme | `lua/plugins/colors.lua` |
| Un keymap | `lua/config/keymaps.lua` o el fitxer del plugin corresponent |
| La statusline | `lua/plugins/statusline.lua` |
| Els parsers de treesitter | `lua/plugins/treesitter.lua` → `ensure_installed` |
| Els LSP instal·lats | `lua/plugins/lsp-setup.lua` → `ensure_installed` |
| La pantalla d'inici | `lua/config/dashboard.lua` |
| Opcions de Neovide | `lua/config/neovide.lua` |
| Format de docstrings | `lua/plugins/neogen.lua` |
| Configuració de clangd | `lua/plugins/lsp-setup.lua` + `.clang-format` a l'arrel del projecte |
