# Keymaps — Neovim

> `<leader>` = **Espai**
> Modes: **n** = normal · **i** = insert · **v** = visual · **o** = operator · **t** = terminal · **c** = command

---

## Generals (`keymaps.lua`)

| Mode | Keymap | Funció |
|------|--------|--------|
| n | `<leader>cd` | Obre el file explorer (netrw) |
| n | `<leader>w` | Guarda el buffer actual |
| n | `<leader>q` | Obre la quickfix list de diagnòstics |
| n | `<leader>td` | Toggle diagnòstics LSP on/off |
| n | `<leader>tm` | Descarta els missatges de Noice |
| n | `<Esc>` | Tanca floating window (hover) o neteja hlsearch |
| i, v | `jj` | Surt a normal mode |
| v | `++` | Copia al porta-retalls del sistema |
| n, v | `<C-ç>` | Toggle comentari |

---

## Navegació entre finestres

| Mode | Keymap | Funció |
|------|--------|--------|
| n | `<C-n>` | Mou el focus a la finestra esquerra |
| n | `<C-p>` | Mou el focus a la finestra dreta |
| n | `<C-l>` | Mou el focus a la finestra inferior |
| n | `<C-m>` | Mou el focus a la finestra superior |
| n | `ww` | Prefix de window (`<C-w>`) |
| n | `wwr` | Intercanvia la finestra actual amb l'anterior |

---

## Moviment (overrides amb centrat automàtic)

| Mode | Keymap | Funció |
|------|--------|--------|
| n | `o` | Nova línia a sota i centra la pàgina |
| n | `O` | Nova línia a sobre i centra la pàgina |
| n | `G` | Va al final del fitxer i centra la pàgina |
| n | `}` | Salta al paràgraf següent i centra |
| n | `{` | Salta al paràgraf anterior i centra |

---

## Terminal

| Mode | Keymap | Funció |
|------|--------|--------|
| t | `<Esc><Esc>` | Surt del mode terminal a normal mode |

---

## LSP (`lsp-setup.lua`) — actius quan hi ha LSP al buffer

| Mode | Keymap | Funció |
|------|--------|--------|
| n | `gd` | Ves a la definició |
| n | `gr` | Mostra totes les referències |
| n | `gI` | Ves a la implementació |
| n | `gy` | Ves a la definició del tipus |
| n | `K` | Mostra documentació hover |
| n | `<leader>rn` | Renombra el símbol |
| n | `<leader>fs` | Formata el fitxer |
| n | `<leader>ca` | Code actions (filtrades) |

---

## Autocomplete (`autocompletion.lua`) — actius quan el menú és obert

| Mode | Keymap | Funció |
|------|--------|--------|
| i | `<C-Space>` | Força obrir el menú d'autocomplete |
| i | `<C-e>` | Tanca el menú sense confirmar |
| i | `<CR>` | Confirma el suggeriment seleccionat |
| i, s | `<Tab>` | Selecciona el següent / expan snippet |
| i, s | `<S-Tab>` | Selecciona l'anterior / retrocedeix en snippet |
| i | `<C-j>` | Selecciona el suggeriment següent |
| i | `<C-k>` | Selecciona el suggeriment anterior |
| i | `<C-d>` | Scroll avall a la documentació |
| i | `<C-u>` | Scroll amunt a la documentació |

---

## Telescope (`telescope.lua`)

| Mode | Keymap | Funció |
|------|--------|--------|
| n | `<leader>sh` | Cerca en l'ajuda de Neovim |
| n | `<leader>sk` | Cerca entre tots els keymaps |
| n | `<leader>sf` | Cerca fitxers del projecte |
| n | `<leader>ss` | Selecciona un picker de Telescope |
| n | `<leader>sw` | Cerca la paraula sota el cursor |
| n | `<leader>sg` | Cerca per contingut (live grep) |
| n | `<leader>sd` | Cerca entre els diagnòstics |
| n | `<leader>sr` | Reprèn l'última cerca |
| n | `<leader>s.` | Cerca fitxers oberts recentment |
| n | `<leader><leader>` | Llista els buffers oberts |
| n | `<leader>/` | Cerca dins el buffer actual (fuzzy) |
| n | `<leader>-` | Cerca fitxers ocults |
| n | `<leader>s/` | Cerca en els fitxers oberts |
| n | `<leader>sn` | Cerca dins la config de Neovim |

---

## Harpoon (`harpoon.lua`)

| Mode | Keymap | Funció |
|------|--------|--------|
| n | `<leader>ha` | Marca el fitxer actual |
| n | `<leader>hh` | Obre el menú de fitxers marcats |
| n | `<leader>hd` | Elimina el fitxer actual de la llista |
| n | `<leader>hx` | Buida tota la llista |
| n | `<leader>1` | Salta al fitxer marcat 1 |
| n | `<leader>2` | Salta al fitxer marcat 2 |
| n | `<leader>3` | Salta al fitxer marcat 3 |
| n | `<leader>4` | Salta al fitxer marcat 4 |

---

## Flash (`flash.lua`)

| Mode | Keymap | Funció |
|------|--------|--------|
| n, x, o | `s` | Salta a qualsevol lloc visible (2-3 lletres) |
| n, x, o | `S` | Salta seleccionant per node de treesitter |
| o | `r` | Flash remote: executa un operador en un lloc llunyà sense moure el cursor |
| c | `<C-s>` | Activa flash mentre escrius una cerca amb `/` |

---

## Lazygit (`lazygit.lua`)

| Mode | Keymap | Funció |
|------|--------|--------|
| n | `<leader>gg` | Obre Lazygit |
| n | `<leader>gf` | Obre Lazygit al fitxer actual |

---

## Which-key (`which-key.lua`) — grups definits

| Prefix | Grup |
|--------|------|
| `<leader>s` | [S]earch |
| `<leader>t` | [T]oggle |
| `<leader>h` | Git [H]unk (n, v) |

---

## Neovim natiu (selecció dels més útils)

| Mode | Keymap | Funció |
|------|--------|--------|
| n | `gg` | Va al principi del fitxer |
| n | `G` | Va al final (override: centra també) |
| n | `zz` | Centra el cursor a la pantalla |
| n | `<C-d>` | Scroll mig pàgina avall |
| n | `<C-u>` | Scroll mig pàgina amunt |
| n | `<C-f>` | Scroll pàgina sencera avall |
| n | `<C-b>` | Scroll pàgina sencera amunt |
| n | `%` | Salta al parèntesi/claudàtor corresponent |
| n | `*` | Cerca la paraula sota el cursor (endavant) |
| n | `#` | Cerca la paraula sota el cursor (enrere) |
| n | `n` / `N` | Següent / anterior resultat de cerca |
| n | `ciw` | Canvia la paraula sota el cursor |
| n | `diw` | Esborra la paraula sota el cursor |
| n | `yiw` | Copia la paraula sota el cursor |
| n | `dd` | Esborra la línia actual |
| n | `yy` | Copia la línia actual |
| n | `p` / `P` | Enganxa a sota / a sobre |
| n | `u` | Desfer |
| n | `<C-r>` | Refer |
| n | `>>` / `<<` | Indenta / desindenta |
| n | `za` | Toggle fold (plegar/desplegar bloc) |
| n | `<C-w>s` | Divideix la finestra horitzontalment |
| n | `<C-w>v` | Divideix la finestra verticalment |
| n | `<C-w>q` | Tanca la finestra actual |
| n | `:bd` | Tanca el buffer actual |
| n | `q:` | Obre l'historial de comandes |
| v | `>` / `<` | Indenta / desindenta selecció |
| i | `<C-w>` | Esborra la paraula anterior |

---

## Markdown

| Mode | Keymap | Funció |
|------|--------|--------|
| n | `<leader>tm` | Toggle markdown preview |

---

## Neo-Tree

| Mode | Keymap | Funció |
|------|--------|--------|
| n | `<leader>e` | Obre/Tanca neo-tree |
| n | `?` | Dins de neo-tree per veure la resta de keybinds |

---

## CMake (`cmake-tools.lua`)

| Mode | Keymap | Funció |
|------|--------|--------|
| n | `<leader>mg` | Genera (cmake configure) |
| n | `<leader>mb` | Build |
| n | `<leader>mr` | Executa |
| n | `<leader>md` | Debug |
| n | `<leader>mt` | Selecciona target |
| n | `<leader>mc` | Neteja (clean) |
| n | `<leader>ms` | Atura la compilació |

---

## Clangd Extensions (`clangd-extensions.lua`)

| Mode | Keymap | Funció |
|------|--------|--------|
| n | `<leader>ch` | Toggle inlay hints |
| n | `<leader>ct` | Jerarquia de tipus |
| n | `<leader>cm` | Memory usage |
| n | `<leader>cs` | Symbol info |

---
 
## mini.surround (`mini-surround.lua`)
 
> Prefix `gz` per no interferir amb flash (`s`). Funciona amb `(`, `)`, `[`, `]`, `{`, `}`, `"`, `'`, `` ` `` i tags HTML.
 
| Mode | Keymap | Funció |
|------|--------|--------|
| n | `gza` + motion + caràcter | Afegeix surround. Ex: `gzaiw"` posa cometes a la paraula |
| n | `gzd` + caràcter | Esborra el surround. Ex: `gzd"` treu les cometes |
| n | `gzr` + vell + nou | Reemplaça surround. Ex: `gzr"'` canvia `"hola"` a `'hola'` |
| n | `gzf` | Busca el surround endavant |
| n | `gzF` | Busca el surround enrere |
| n | `gzh` | Ressalta el surround |
---

## Lazygit — Tutorial
 
> Obre lazygit des de Neovim amb `<leader>gg` o `<leader>gf`.
> Prem `?` en qualsevol moment per veure els keymaps del context actual. `q` per sortir.
 
### La interfície
 
```
┌─────────────┬──────────────────────────────────┐
│ 1. Status   │                                  │
│ 2. Files    │   Preview / Diff                 │
│ 3. Branches │                                  │
│ 4. Commits  │                                  │
│ 5. Stash    │                                  │
└─────────────┴──────────────────────────────────┘
```
 
Navega entre panells amb `1` `2` `3` `4` `5` o `Tab`. Dins de cada panell, `j`/`k` per moure't.
 
### Panell Files (`2`) — git add i stage
 
| Keymap | Funció |
|--------|--------|
| `Space` | Stage/unstage el fitxer seleccionat (`git add`) |
| `a` | Stage/unstage TOTS els fitxers (`git add .`) |
| `Enter` | Entra al fitxer per fer stage de línies individuals |
| `Space` (dins fitxer) | Stage/unstage la línia o hunk seleccionat |
| `v` (dins fitxer) | Selecciona un rang de línies |
| `S` | Obre el menú d'stash |
| `A` | Amend del darrer commit amb els canvis en stage |
 
### Commit i push
 
| Keymap | Funció |
|--------|--------|
| `c` | Commit (obre editor de missatge) |
| `C` | Commit amb l'editor extern |
| `A` | Amend — modifica el darrer commit |
| `P` | Push |
| `p` | Pull |
 
### Panell Branches (`3`)
 
| Keymap | Funció |
|--------|--------|
| `n` | Crea una branca nova |
| `Space` | Checkout de la branca seleccionada |
| `M` | Merge de la branca seleccionada a l'actual |
| `r` | Rebase de l'actual sobre la seleccionada |
| `d` | Esborra la branca |
| `f` | Fetch de la branca |
| `o` | Obre la pull request al navegador |
 
### Panell Commits (`4`)
 
| Keymap | Funció |
|--------|--------|
| `s` | Squash amb el commit anterior |
| `f` | Fixup (squash sense editar missatge) |
| `r` | Renombra el missatge del commit |
| `d` | Drop (elimina el commit) |
| `e` | Edita el commit (interactive rebase) |
| `p` | Cherry-pick del commit seleccionat |
| `ctrl+j` / `ctrl+k` | Mou el commit avall / amunt |
| `Enter` | Veu els fitxers del commit |
| `i` | Inicia rebase interactiu |
| `m` → continue | Completa el rebase |
 
### Panell Stash (`5`)
 
| Keymap | Funció |
|--------|--------|
| `Space` | Aplica l'stash seleccionat |
| `g` | Pop de l'stash (aplica i elimina) |
| `d` | Esborra l'stash |
| `n` | Crea una branca des de l'stash |
 
### Navegació general
 
| Keymap | Funció |
|--------|--------|
| `[` / `]` | Navega entre tabs dins d'un panell |
| `ctrl+f` / `ctrl+b` | Scroll del preview |
| `/` | Filtra/busca dins el panell actual |
| `Enter` | Entra al detall |
| `Esc` | Torna enrere |
| `?` | Mostra tots els keymaps del context |
| `q` | Tanca lazygit |
 
---
 
### Conceptes clau de Git
 
**`git add` / Stage** — Marcar quins canvis vols incloure al proper commit. A lazygit és `Space` per fitxer o `a` per tot.
 
**`git stash`** — Guardar temporalment els teus canvis sense fer commit, per poder canviar de branca o context i recuperar-los després. Útil quan has d'interrompre la feina a mitges.
```
treballant en feature X → necessito canviar de branca urgentment
→ S (stash) → canvio de branca → arreglo el bug → torno
→ panell Stash → g (pop) → continuo treballant en feature X
```
 
**`git commit --amend`** — Modificar el darrer commit sense crear-ne un de nou. Útil si t'has deixat un fitxer o vols corregir el missatge. A lazygit: fes stage dels canvis nous i prem `A`.
> ⚠️ Si ja has fet push del commit, l'amend requerirà `push --force`.
