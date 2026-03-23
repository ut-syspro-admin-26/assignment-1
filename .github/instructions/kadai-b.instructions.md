---
applyTo: "kadai-b/**"
---

**Problem statement:** Create a shell script `sort.sh` that finds all `*.c` files in the coreutils source tree, sorts them by line count in ascending order, and writes the filenames to `result.txt`.

**Requirements:**

- Search recursively, including subdirectories
- Use pipes to chain commands
- Do not output line counts to `result.txt`
- Start with extracting `coreutils-8.9.tar.gz`
