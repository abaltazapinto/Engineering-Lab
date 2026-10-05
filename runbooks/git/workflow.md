# Git workstation workflow and tracking diagnosis

Migrated in Phase 2 Batch 1, 2026-10-05. Source notes contain procedures and historical lessons; original incident dates/platform versions are not established unless stated. Migration does not prove a fix on every machine.

## Symptoms

The expected branch is missing, a branch has no upstream, pull arguments name the wrong remote/branch, or an update cannot fast-forward. These are source workflow lessons, not a migrated incident with verified cause/outcome.

## Environment

A Git working repository. Discover local branches, remotes and tracking instead of assuming the default branch is `main`; the inspected scripts source uses `master`. Do not persist remote URLs containing credentials or unrelated personal output.

## Investigation

Read-only local inspection:
```bash
git status --short --branch
git branch --show-current
git branch -vv
git remote -v
git diff
git diff --staged
git log --oneline --decorate --graph -10
```
Inspect the intended branch's tracking relationship from `git branch -vv`. A fetch updates remote-tracking information but does not itself integrate commits into the working branch; perform remote/network operations only when authorized.

## Root cause

A branch name and a remote name are different inputs. Pull syntax is `git pull [options] [remote] [branch]`. An unset upstream or diverging history requires its own inspected resolution; do not claim a failed fast-forward proves corruption.

## Fix

When an update is authorized, inspect local changes and select the actual configured remote/branch before using a fast-forward-only update. Example placeholders are not literal commands to paste:
```text
git fetch <configured-remote>
git pull --ff-only <configured-remote> <intended-branch>
```
If fast-forward is refused, stop and inspect divergence; do not automatically reset, rebase, force-push or discard changes.

For a local checkpoint after explicit authorization, select exact files, inspect the staged diff and check whitespace before committing. Publishing/upstream setup is a separate authorized action. The [standalone post-PR checklist](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/GIT/procedure_AFTER_PR.md) stays in scripts; branch retirement is not copied into this guide.

## Verification

Recheck status, current branch, tracking and history after the intended action. For content updates inspect both `git diff --check` and `git diff --cached --check` as appropriate: unstaged checks do not cover newly staged files. No fetch, pull, commit, push or source branch cleanup was performed as a test during this batch.

## Persistence

Branch/upstream configuration and committed history persist; worktree observations are point-in-time. No private remote URL or branch-specific machine state is added to canonical documentation.

## Rollback

Before a mutating operation, inspect the concrete recovery path and preserve local work. `git restore` can discard unstaged edits; it is not a universal rollback command. Do not migrate destructive branch-deletion or hard-reset recipes as default recovery.

## Lessons learned

Inspect before changing. Explicit file selection avoids staging unrelated changes. Fast-forward-only refusal is an inspection boundary, not permission to rewrite history. A source checklist's branch name does not define every repository's default.

## References

[scripts: AGENTE/LINUX_ENGINEERING_NOTEBOOK.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/AGENTE/LINUX_ENGINEERING_NOTEBOOK.md) — section 20 only, no personal/host/network material. [scripts: GIT/procedure_AFTER_PR.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/GIT/procedure_AFTER_PR.md) was inspected for boundary/overlap and remains source-only.

[Git pull reference](https://git-scm.com/docs/git-pull); [Git branch reference](https://git-scm.com/docs/git-branch).
