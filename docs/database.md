# Datenbanken in Neovim (vim-dadbod)

Setup: [`lua/plugins/database.lua`](../lua/plugins/database.lua)

Plugins:
- [`tpope/vim-dadbod`](https://github.com/tpope/vim-dadbod) — Core-Engine, führt Queries gegen die DB aus
- [`kristijanhusak/vim-dadbod-ui`](https://github.com/kristijanhusak/vim-dadbod-ui) — UI zum Verwalten von Connections, Browsen von Tabellen, Ausführen von Queries
- [`kristijanhusak/vim-dadbod-completion`](https://github.com/kristijanhusak/vim-dadbod-completion) — Autocompletion für Tabellen-/Spaltennamen in SQL-Buffern (via `blink.cmp`)

## Quick Start

1. Nach dem nächsten Start von nvim werden die Plugins automatisch installiert (`:Lazy sync` falls nötig).
2. `<leader>Du` öffnet die DBUI-Sidebar.
3. In der Sidebar `<leader>Da` (oder `a` in der DBUI) um eine neue Connection hinzuzufügen. Connection-String-Format:

   ```
   postgresql://user:password@host:port/database
   mysql://user:password@host:port/database
   sqlite:/absoluter/pfad/zur.db
   ```

4. In der Sidebar mit `<CR>` Connection aufklappen → Tabellen erscheinen → `<CR>` auf einer Tabelle zeigt die ersten Zeilen.
5. Mit `S` (in der Sidebar auf einer Connection/Tabelle) öffnet sich ein Scratch-Buffer für eigene Queries.
6. Query ausführen: im Query-Buffer `<leader>S` bzw. `BB` (siehe unten).

## Eigene Queries schreiben & ausführen

- Neuer Query-Buffer aus der Sidebar: `S` auf einer Connection.
- Im Query-Buffer (Dateityp `sql`, `mysql`, `plsql`):
  - `<leader>S` — komplette Query ausführen
  - Visueller Modus + `<leader>S` — nur Auswahl ausführen
- Autocompletion für Tabellen-/Spaltennamen ist automatisch aktiv (via `blink.cmp`, Quelle `Dadbod`).

## Connections dauerhaft speichern

Statt jedes Mal über die UI eine Connection anzulegen, kannst du sie projektbezogen in einer `.nvim.lua` / `.exrc` oder global in deiner `init.lua` hinterlegen:

```lua
vim.g.dbs = {
  { name = "local_pg", url = "postgresql://user:pass@localhost:5432/mydb" },
  { name = "prod_ro",  url = "postgresql://user:pass@prod-host:5432/mydb" },
}
```

Diese tauchen dann automatisch in der DBUI-Sidebar auf. **Keine Passwörter in versionierte Dateien committen** — für sensible Connections lieber `.nvim.lua` (nicht getrackt) oder Umgebungsvariablen im Connection-String nutzen.

Gespeicherte UI-Queries (`SaveQuery`) landen unter `stdpath("data")/dadbod_ui` (siehe `db_ui_save_location` in der Plugin-Config).

## Keybindings

### Global (aus `lua/plugins/database.lua`)

| Keybinding      | Aktion                        |
|-----------------|-------------------------------|
| `<leader>Du`    | DBUI ein-/ausblenden          |
| `<leader>Da`    | Neue Connection hinzufügen    |
| `<leader>Df`    | Zu offenem DB-Buffer springen |
| `<leader>Dr`    | Aktuellen Buffer umbenennen   |
| `<leader>Dq`    | Infos zur letzten Query       |

### In der DBUI-Sidebar (Plugin-Standard)

| Taste   | Aktion                                      |
|---------|----------------------------------------------|
| `<CR>`  | Knoten auf-/zuklappen bzw. Query ausführen   |
| `o`     | Knoten auf-/zuklappen                        |
| `S`     | Neuen Query-Buffer für Connection/Tabelle    |
| `d`     | Buffer/Connection löschen                    |
| `R`     | Sidebar neu laden                            |
| `A`     | Connection hinzufügen                        |
| `H`     | History der letzten Queries anzeigen         |
| `q`     | Sidebar-Fenster schließen                    |

### Im Query-Buffer (Dateityp `sql` etc., Plugin-Standard)

| Keybinding      | Aktion                              |
|-----------------|--------------------------------------|
| `<leader>S`     | Query (bzw. Auswahl im Visual Mode) ausführen |
| `<leader>W`     | Query speichern (`SaveQuery`)        |
| `<leader>E`     | Verbindungs-Parameter der Query bearbeiten |

> Hinweis: Die DBUI/Query-Buffer-Keymaps sind Plugin-Defaults von `vim-dadbod-ui` und lassen sich über `vim.g.db_ui_*`-Optionen anpassen (siehe [Plugin-README](https://github.com/kristijanhusak/vim-dadbod-ui#configuration)).

## Troubleshooting

- **Keine Autocompletion**: Prüfe, ob der Buffer-Dateityp `sql`/`mysql`/`plsql` ist (`:set filetype?`) — die `Dadbod`-Quelle in `blink.cmp` ist nur für diese Filetypes aktiv.
- **Connection schlägt fehl**: Query-Buffer öffnen, `<leader>Dq` bzw. `:DBUILastQueryInfo` für Fehlerdetails.
- **DBUI zeigt keine Connections**: `:DBUI` statt `:DBUIToggle` ausführen, um Fehler beim ersten Laden zu sehen.
