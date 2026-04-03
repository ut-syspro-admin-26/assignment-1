---
argument-hint: "the commit hash: changes after it are reviewed"
agent: agent
---
Please review the changes after commit <commit> and see if assignment requirements are satisfied for each problem.
To obtain the diff, run:
```
git --no-pager diff --no-ext-diff <commit>
```
You may read files, but you may not run any commands except this one.
Check whether assignment requirements are satisfied based only on the changes and the file contents.
The <commit> argument is provided below:
