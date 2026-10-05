# Reusable configuration templates

Store reviewed, reproducible configuration templates here. Use parameters for machine-specific values and external references for secrets; never embed secret values.

Machine records link templates and record exceptions. No personal shell/editor configuration was imported in Phase 1.

## Optional workstation fragments — Phase 2 Batch 1

- [bash/aliases.sh](bash/aliases.sh): five reviewed development/listing aliases, sourced from the reusable Pthreads guide. [C debugging](../../runbooks/development/c-debugging.md) explains use and verification; no personal bashrc, PATH or account settings are copied.
- [vim/markdown-images.vim](vim/markdown-images.vim): optional buffer-local Markdown image mapping, requiring an inspected plugin installation. [Clipboard-image diagnosis](../../runbooks/development/vim-clipboard-images.md) owns prerequisites and verification.

These fragments are not auto-installed or auto-sourced. Inspect existing mappings/aliases and preserve local backups before choosing to load them. They do not define installed capability state on any machine or populate platform package mappings.
