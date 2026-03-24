---
argument-hint: "the commit hash: changes since it are reviewed"
agent: agent
---
Please review the changes since commit <commit> and see if assignment requirements are satisfied for each problem.
To obtain the diff, run:
```
git --no-pager diff --no-ext-diff <commit>^
```
While reviewing changes, you may read files and run additional commands to gather more information.
The <commit> argument is provided below:
