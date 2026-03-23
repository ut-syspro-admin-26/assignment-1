---
applyTo: "kadai-e/**"
---

**Context:** Consider capturing the output of the following command to files:
```
strace /bin/cat /proc/meminfo
```

**Problem statement:** Create a shell script `output.sh` that runs the above command and redirects its output as follows:

1. `cat.txt` — capture only the output produced by `cat` (stdout)
2. `strace.txt` — capture only the output produced by `strace` (stderr)
3. `all.txt` — capture both outputs

**Requirements:**

- Do **not** use `strace`'s built-in file output option.
- The command may be executed at most **two times** within `output.sh`. Side effects from multiple executions can be ignored.
