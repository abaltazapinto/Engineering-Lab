# Vim operational editing and configuration diagnosis

Migrated in Phase 2 Batch 1, 2026-10-05. Source notes contain procedures and historical lessons; original incident dates/platform versions are not established unless stated. Migration does not prove a fix on every machine.

## Symptoms

Editing keys act in the wrong mode; a directory opens instead of a file; a search reports E486; indentation or multi-line comments do not behave as expected.

## Environment

Vim on a Linux workstation. Start with `vim --version`; inspect existing mappings before configuration changes. Clipboard-image diagnosis is owned by [vim-clipboard-images.md](vim-clipboard-images.md).

## Investigation

Press Esc before Normal-mode instructions. In Vim inspect:
```vim
:file
:pwd
:buffers
:set filetype?
:scriptnames
```
A directory argument opens Netrw; use `:e path/to/file.md` for a file. Buffers are in-memory files; splits are views, not separate copies. Compare behavior with `vim -Nu NONE` to isolate custom configuration; do not overwrite vimrc.

## Root cause

E486 means the searched pattern was not found, not that the file was damaged. Wrong mode, filetype or mapping are separate hypotheses until inspected. The source's `vv=G` indentation shorthand is ambiguous; use an explicit selection instead.

## Fix

Canonical editing reference (Normal mode unless prefixed with a colon):

| Purpose | Keys / command |
|---|---|
| Insert, new line | `i`, `o` |
| Undo / redo | `u` / Ctrl-r |
| Save / quit | `:w` / `:q` |
| Search / next match | `/pattern` / `n` |
| Copy / paste a line | `yy` / `p` |
| Select all / indent selected text | `ggVG`, then `=` |
| Split / keep one window | `:vsplit` / `:only` |
| Inspect mapping origin | `:verbose map <key>` |

For block comments: move to the starting column, Ctrl-v, select lines, Shift-I, type the language's comment prefix, then Esc. Remove only those prefix columns with a block selection and `x`. Use language-appropriate syntax; no generic prefix works for every language.

`:%d` deletes buffer contents; `:q!` and `:e!` discard unsaved changes. These are not normal diagnosis steps.

## Verification

On a disposable buffer, confirm block insertion and undo it; check reindentation before saving. After a config change, reload the inspected file and recheck mapping origin/filetype. Batch smoke checks cover block insertion on scratch text; they do not test a user's personal vimrc.

## Persistence

Normal edits persist after saving. Command-line settings/mappings can be session-local; persist only reviewed minimal configuration. Do not duplicate clipboard mapping in this guide.

## Rollback

Use `u` for an unsaved edit; restore a reviewed local backup for configuration changes. A closed buffer or already overwritten file may require versioned recovery; do not promise undo covers it.

## Lessons learned

Keep Netrw directories, buffers and windows distinct. `:only` closes other windows, not source files. Visual block insertion differs from Visual line selection. A failed search is evidence about a pattern, not file integrity.

## References

[scripts: LINUX_GERAIS/VIM/needed_all_time.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/LINUX_GERAIS/VIM/needed_all_time.md); [scripts: AGENTE/vim/VIM.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/AGENTE/vim/VIM.md) — operational sections only, excluding user environment and agent policies.

[Vim visual-mode reference](https://vimhelp.org/visual.txt.html).
