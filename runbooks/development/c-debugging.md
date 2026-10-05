# C / Pthreads debugging with GDB, Memcheck and Helgrind

Migrated in Phase 2 Batch 1, 2026-10-05. Source notes contain procedures and historical lessons; original incident dates/platform versions are not established unless stated. Migration does not prove a fix on every machine.

## Symptoms

Valgrind is pointed at C source; a local binary is not found; GDB steps into library internals; thread IDs are mistaken for stable identities; a memory-clean test is treated as proof of race freedom.

## Environment

A Linux C/Pthreads development environment with compiler, GDB and Valgrind available. Source examples are learning procedures, not proof that a particular program passed. Run only a reviewed disposable program; debugger/program execution can have side effects.

## Investigation

Inspect available tools and resolve aliases before using them:
```bash
command -v cc
command -v gdb
command -v valgrind
type ccwp val valrace
```
Optional canonical aliases are defined once in [aliases.sh](../../configs/templates/bash/aliases.sh). Inspect that fragment before sourcing it in an interactive shell; tool availability is still required.

## Root cause

Valgrind executes a built program, not a `.c` source file. A bare filename is looked up through PATH; a current-directory executable is addressed with `./`. `step` deliberately enters called functions, so arriving in libc is not evidence of damaged code. Memcheck and Helgrind investigate different error classes.

## Fix

For a disposable example named `example.c`:
```bash
cc -Wall -Wextra -Werror -g -O0 -pthread example.c -o example
./example
valgrind --leak-check=full --show-leak-kinds=all ./example
valgrind --tool=helgrind ./example
gdb ./example
```
In GDB:
```gdb
break main
run
info threads
thread apply all bt
info locals
next
```
Use `step` to enter a function, `finish` to return from the current function, and `continue` to run to the next stop. Select a thread only using its currently listed ID. TUI commands `layout src`, `layout split` and `refresh` help recover orientation. Inspect `show scheduler-locking` before any deliberate scheduling change: debugger scheduling can change behavior and must not be mistaken for normal execution.

The source also records `/n` in a C string as literal text; use the language's `\n` escape for a newline.

## Verification

Read Memcheck and Helgrind reports independently and reproduce the actual symptom. Zero reported errors cover only the paths exercised, not proof of universal correctness. Batch smoke checks compile a small synthetic Pthreads example and run both tools plus a batch GDB session; they do not validate an existing project or TUI interaction.

## Persistence

Build flags affect that build. Alias changes affect shells loading the optional fragment. No compiler settings are installed into every machine or profile by this batch.

## Rollback

Run debugging on disposable build outputs. Undo reviewed alias configuration through the previous local config. Restore scheduling mode if changed; do not hard-code an assumed prior mode. Never terminate arbitrary application processes just to test the guide.

## Lessons learned

Keep source files, executable paths and debugger commands distinct. Multiple workers hitting a function breakpoint are expected; discover thread IDs each run. A leak-free result can still contain data races. Preserve failure modes without importing teaching dialogue or console transcripts.

## References

[scripts: LINUX_GERAIS/gdb_comands.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/LINUX_GERAIS/gdb_comands.md); [scripts: LINUX_GERAIS/linux_pthreads_valgrind_commands.md](https://github.com/abaltazapinto/scripts/blob/c367a2fbef46eec94f16277a1c8e8bd4c2fda822/LINUX_GERAIS/linux_pthreads_valgrind_commands.md) — technical recipes only; conversation wrappers and personal shell transcript omitted.

[GDB manual](https://sourceware.org/gdb/current/onlinedocs/gdb/); [Valgrind manual](https://valgrind.org/docs/manual/manual.html); [Helgrind manual](https://valgrind.org/docs/manual/hg-manual.html).
