# Debugger (nvim-dap)

Setup: [`lua/config/lazy.lua`](../lua/config/lazy.lua) über die LazyVim-Extras `dap.core`, `lang.python` und `lang.rust`. Eine eigene DAP-Konfiguration gibt es in diesem Repo nicht.

Plugins:
- [`mfussenegger/nvim-dap`](https://github.com/mfussenegger/nvim-dap): Debug Adapter Protocol Client, die eigentliche Debugger-Engine
- [`rcarriga/nvim-dap-ui`](https://github.com/rcarriga/nvim-dap-ui): UI mit Variablen, Stack, Breakpoints, Watches, REPL und Konsole
- [`theHamsta/nvim-dap-virtual-text`](https://github.com/theHamsta/nvim-dap-virtual-text): zeigt Variablenwerte direkt im Code als Virtual Text
- [`jay-babu/mason-nvim-dap.nvim`](https://github.com/jay-babu/mason-nvim-dap.nvim): installiert Debug-Adapter über Mason
- [`mfussenegger/nvim-dap-python`](https://github.com/mfussenegger/nvim-dap-python): Python-Integration (Adapter `debugpy`)
- [`mrcjkb/rustaceanvim`](https://github.com/mrcjkb/rustaceanvim): Rust-Integration (Adapter `codelldb`)

> Die Tastenbelegungen unten sind die LazyVim-Defaults. Die tatsächlich aktiven Belegungen zeigt `<leader>d` (kurz warten, dann erscheint which-key) oder `:map <leader>d`.

## Quick Start

1. Datei öffnen, die du debuggen willst.
2. Mit `<leader>db` einen Breakpoint auf der aktuellen Zeile setzen.
3. Mit `<leader>dc` den Debugger starten. Gibt es mehrere Konfigurationen, erscheint eine Auswahl (z. B. "Launch file").
4. Die DAP-UI öffnet sich automatisch, sobald die Session startet, und schließt sich wieder, wenn sie endet.
5. Mit `<leader>dO` (Step Over), `<leader>di` (Step Into) und `<leader>do` (Step Out) durch den Code gehen.
6. Mit `<leader>dt` die Session beenden.

## Breakpoints

| Taste | Aktion |
|---|---|
| `<leader>db` | Breakpoint an/aus |
| `<leader>dB` | Bedingten Breakpoint setzen (fragt nach einer Bedingung, z. B. `i > 10`) |

## Ausführung steuern

| Taste | Aktion |
|---|---|
| `<leader>dc` | Starten bzw. fortsetzen (Continue) |
| `<leader>da` | Starten mit Argumenten (fragt nach den Programm-Argumenten) |
| `<leader>dl` | Letzte Debug-Konfiguration erneut starten |
| `<leader>dC` | Bis zum Cursor laufen |
| `<leader>dg` | Zur Zeile springen, ohne den Code dazwischen auszuführen |
| `<leader>dO` | Step Over (nächste Zeile, ohne in Funktionen zu springen) |
| `<leader>di` | Step Into (in die Funktion hinein) |
| `<leader>do` | Step Out (aus der aktuellen Funktion heraus) |
| `<leader>dP` | Pausieren |
| `<leader>dt` | Session beenden (Terminate) |

## Stack & Inspektion

| Taste | Aktion |
|---|---|
| `<leader>dj` | Im Call-Stack einen Frame nach unten |
| `<leader>dk` | Im Call-Stack einen Frame nach oben |
| `<leader>dw` | Wert unter dem Cursor in einem Hover-Fenster anzeigen |
| `<leader>de` | Ausdruck auswerten (Normal-Modus: Wort unter dem Cursor, Visual-Modus: Auswahl) |
| `<leader>dr` | REPL an/aus (in Rust-Dateien belegt, siehe unten) |
| `<leader>ds` | Laufende Debug-Sessions anzeigen |

## DAP-UI

| Taste | Aktion |
|---|---|
| `<leader>du` | DAP-UI ein/aus |

Die UI besteht aus mehreren Fenstern:
- **Scopes:** lokale und globale Variablen des aktuellen Frames
- **Breakpoints:** alle gesetzten Breakpoints
- **Stacks:** Call-Stack aller Threads
- **Watches:** selbst definierte Ausdrücke, die bei jedem Schritt neu ausgewertet werden
- **REPL:** Ausdrücke im Kontext des Programms ausführen
- **Console:** Ausgabe des Programms

Tasten innerhalb der UI-Fenster:

| Taste | Aktion |
|---|---|
| `<CR>` | Eintrag aufklappen/zuklappen |
| `o` | Eintrag öffnen (z. B. Frame oder Breakpoint im Code anspringen) |
| `e` | Wert bzw. Watch-Ausdruck bearbeiten |
| `d` | Eintrag entfernen (z. B. Watch oder Breakpoint) |
| `r` | Wert an die REPL senden |
| `t` | Breakpoint an/aus |

Eine neue Watch fügst du im Watches-Fenster hinzu, indem du in den Insert-Modus gehst, den Ausdruck eingibst und `<CR>` drückst.

## Python

Adapter: `debugpy` (wird über Mason installiert).

| Taste | Aktion |
|---|---|
| `<leader>dPt` | Test-Methode unter dem Cursor debuggen |
| `<leader>dPc` | Test-Klasse unter dem Cursor debuggen |

- Mit `<leader>dc` und "Launch file" startest du die aktuelle Datei.
- Als Interpreter für dein Programm nutzt `nvim-dap-python` zuerst ein aktiviertes Environment (`$VIRTUAL_ENV`, `$CONDA_PREFIX`) und sucht sonst nach `venv`, `.venv`, `env` oder `.env` im Arbeitsverzeichnis. Am einfachsten ist es also, nvim aus dem Projektordner mit `.venv` heraus zu starten.

## Rust

Adapter: `codelldb` (wird über Mason installiert), angebunden über `rustaceanvim`.

| Taste | Aktion |
|---|---|
| `<leader>dr` | Debuggables auswählen (Binaries, Tests, Examples). Überschreibt in Rust-Dateien die REPL-Taste |

- Alternativ kannst du `:RustLsp debuggables` oder `:RustLsp debug` (Target unter dem Cursor) direkt aufrufen.
- Über den Code-Lenses (`▶︎ Debug` über `main` oder Tests) lässt sich ebenfalls direkt debuggen.

## Eigene Launch-Konfigurationen

`nvim-dap` liest automatisch eine `.vscode/launch.json` im Projekt-Root ein. Die Konfigurationen tauchen dann in der Auswahl bei `<leader>dc` auf, z. B. für ein Python-Modul:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "python",
      "request": "launch",
      "name": "Modul starten",
      "module": "myapp",
      "args": ["--verbose"],
      "justMyCode": false
    }
  ]
}
```

Alternativ kannst du Konfigurationen in Lua unter `lua/plugins/` ergänzen:

```lua
return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")
    dap.configurations.python = dap.configurations.python or {}
    table.insert(dap.configurations.python, {
      type = "python",
      request = "launch",
      name = "Django runserver",
      program = "${workspaceFolder}/manage.py",
      args = { "runserver", "--noreload" },
      django = true,
    })
  end,
}
```
