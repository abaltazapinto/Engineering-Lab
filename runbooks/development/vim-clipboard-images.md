# Vim Markdown clipboard-image diagnosis

Migrated in Phase 2 Batch 1, 2026-10-05. Source notes contain procedures and historical lessons; original incident dates/platform versions are not established unless stated. Migration does not prove a fix on every machine.

## Symptoms

The image-paste key acts as ordinary text paste, a PNG cannot be read, or a saved image does not render. Source notes describe an escaped `$HOME` and exact filename/case problems; no complete timestamped incident transcript is migrated.

## Environment

Vim with an inspected `img-paste.vim` installation and its `mdip#MarkdownClipboardImage()` function. X11 clipboard examples use `xclip`. Neither plugin nor clipboard utility is assumed installed on a target machine. [Session diagnosis](../desktop/x11-wayland-diagnostics.md) owns X11/Wayland checks.

## Investigation

Check tools and clipboard support:
```bash
command -v xclip
vim --version
```
Inside the actual Markdown buffer:
```vim
:set filetype?
:echo get(g:, 'mapleader', '\')
:verbose nmap <leader>p
:scriptnames
```
Use the actual configured leader key if needed to inspect its expanded mapping. A missing/inactive mapping can fall through to ordinary paste; inspect filetype and plugin loading rather than assume the plugin failed.

On a confirmed X11 session:
```bash
xclip -selection clipboard -t TARGETS -o
```
Look for `image/png`; do not copy the clipboard's potentially personal contents into repository notes.

## Root cause

An escaped dollar sign makes Bash treat `$HOME` literally. A mismatched filename/case gives a path lookup failure. Missing mappings, missing image targets and wrong relative Markdown paths are separate failure branches; a specific plugin root cause is not established without its evidence.

## Fix

Select a known PNG locally rather than silently using the latest screenshot:
```bash
read -r -p 'Exact PNG path: ' PNG_PATH
test -f "${PNG_PATH:?Select an existing PNG}" && file "$PNG_PATH"
xclip -selection clipboard -t image/png -i "$PNG_PATH"
```
Use quoted `"$HOME/…"`, not an escaped dollar sign. This example assumes the inspected file is a PNG.

The canonical optional mapping is [markdown-images.vim](../../configs/templates/vim/markdown-images.vim). Inspect existing vimrc and mappings before sourcing that fragment; it is not auto-installed and does not install the plugin. Reopen a Markdown buffer or apply its filetype event after loading. Invoke the inspected leader mapping, then select a non-personal image filename.

If the save succeeds but rendering fails, verify case, extension and path relative to the Markdown file. Use the preview to render images; Vim editing alone is not a rendering test.

## Verification

Confirm mapping origin and target, clipboard PNG target, saved image type/path and successful preview. If documenting an actual image, include the image and Markdown together after checking image contents for personal/sensitive data. Batch checks validate mapping setup without invoking a real clipboard or plugin function; end-to-end GUI behavior remains untested.

## Persistence

The mapping persists only if a reviewed fragment is loaded by the intended config. Clipboard state is transient; session changes may require a different backend. No Wayland solution is assumed verified.

## Rollback

Undo accidental text paste with `u`. Restore the previous mapping/config fragment from a local backup if changed. Do not replace an entire personal vimrc to repair one mapping.

## Lessons learned

Ordinary `p` and plugin image paste are different operations. Exact filenames and relative paths matter. Do not misdiagnose a literal `$HOME` path as a Tab or permissions problem. Investigate Wayland compatibility before treating xclip failure as a file problem.

## References

[scripts: LINUX_GERAIS/vim_clipboard_image.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/LINUX_GERAIS/vim_clipboard_image.md); [scripts: AGENTE/vim/VIM.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/AGENTE/vim/VIM.md) — image workflow, mapping and diagnosis subset only.

Local Vim help: `:help mapleader`, `:help :verbose`, `:help FileType`.
