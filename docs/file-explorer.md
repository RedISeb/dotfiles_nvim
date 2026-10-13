# File Explorer (Snacks Explorer)

LazyVim bringt als Standard-Explorer den [Snacks Explorer](https://github.com/folke/snacks.nvim/blob/main/docs/explorer.md) mit (Teil von `folke/snacks.nvim`). Er ist ohne Extra aktiv, eine eigene Konfiguration gibt es in diesem Repo nicht.

> Die Tastenbelegungen unten sind die Snacks-Defaults. Die tatsächlich aktiven Belegungen zeigt `?` im Explorer an.

## Öffnen

| Taste | Aktion |
|---|---|
| `<leader>e` | Explorer im Projekt-Root öffnen/schließen |
| `<leader>E` | Explorer im aktuellen Arbeitsverzeichnis (cwd) öffnen/schließen |
| `<leader>fe` | wie `<leader>e` |
| `<leader>fE` | wie `<leader>E` |

## Dateien & Ordner verwalten

| Taste | Aktion |
|---|---|
| `a` | Datei/Ordner anlegen. Mit `/` am Ende entsteht ein Ordner (`utils/`), Pfade wie `foo/bar/baz.lua` legen fehlende Ordner mit an |
| `r` | Umbenennen |
| `d` | Löschen (auch für mehrere ausgewählte Einträge) |
| `c` | Kopieren. Ohne Auswahl wird nach einem neuen Namen gefragt, mit Auswahl werden die gewählten Einträge in den aktuellen Ordner kopiert |
| `m` | Ausgewählte Einträge in den aktuellen Ordner verschieben |
| `y` | Pfad(e) yanken (auch im Visual-Modus) |
| `p` | Geyankte Dateien in den aktuellen Ordner einfügen |
| `o` | Mit der System-Anwendung öffnen |
| `u` | Explorer aktualisieren |

### Mehrfachauswahl

| Taste | Aktion |
|---|---|
| `<Tab>` | Eintrag auswählen und zum nächsten springen |
| `<S-Tab>` | Eintrag auswählen und zum vorherigen springen |
| `<C-a>` | Alle auswählen |

Beispiel zum Verschieben mehrerer Dateien: Dateien mit `<Tab>` markieren, dann zum Zielordner navigieren und `m` drücken.

## Navigation

| Taste | Aktion |
|---|---|
| `j` / `k` | Runter / hoch |
| `gg` / `G` | Zum Anfang / Ende |
| `l` / `<CR>` | Datei öffnen bzw. Ordner aufklappen |
| `h` | Ordner zuklappen |
| `<BS>` | Ein Verzeichnis nach oben wechseln |
| `.` | Ausgewählten Ordner zum neuen Root machen |
| `Z` | Alle Ordner zuklappen |
| `<C-c>` | Neovims cwd auf den aktuellen Ordner setzen (`:tcd`) |

## Öffnen in Splits/Tabs

| Taste | Aktion |
|---|---|
| `<C-v>` | Im vertikalen Split öffnen |
| `<C-s>` | Im horizontalen Split öffnen |

## Anzeige & Filter

| Taste | Aktion |
|---|---|
| `H` | Versteckte Dateien (Dotfiles) ein/aus |
| `I` | Von Git ignorierte Dateien ein/aus |
| `P` | Vorschau ein/aus |
| `i` | Ins Suchfeld wechseln, um die Liste zu filtern |
| `/` | Fokus zwischen Liste und Suchfeld wechseln |
| `<C-d>` / `<C-u>` | Liste scrollen |
| `<C-f>` / `<C-b>` | Vorschau scrollen |

## Git & Diagnostics

| Taste | Aktion |
|---|---|
| `]g` / `[g` | Nächste / vorherige Datei mit Git-Änderungen |
| `]d` / `[d` | Nächste / vorherige Datei mit Diagnostics |
| `]e` / `[e` | Nächste / vorherige Datei mit Errors |
| `]w` / `[w` | Nächste / vorherige Datei mit Warnings |

## Sonstiges

| Taste | Aktion |
|---|---|
| `<leader>/` | Grep im aktuellen Ordner |
| `<C-t>` | Terminal im aktuellen Ordner öffnen |
| `?` | Hilfe mit allen aktiven Tastenbelegungen |
| `q` / `<Esc>` | Explorer schließen |

## Anpassen

Belegungen und Optionen lassen sich in einer Datei unter `lua/plugins/` überschreiben, z. B.:

```lua
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true, -- Dotfiles standardmäßig anzeigen
          ignored = false, -- Git-ignorierte Dateien ausblenden
          win = {
            list = {
              keys = {
                ["N"] = "explorer_add", -- Beispiel: zusätzliche Taste zum Anlegen
              },
            },
          },
        },
      },
    },
  },
}
```
