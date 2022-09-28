# gitlog

Quick powershell script to generate the correct logs for a branch to add to the JIRA check-in details.

## Usage
Choose either `gitlog-tradition.ps1` for TortoiseSVN style logs or `gitlog.ps1` for a slightly updated look, chuck it in a folder that is on your $PATH (make sure you rename `gitlog-traditional.ps1` to `gitlog.ps1` if you've chosen it).

Set your execution policy ([see here](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.2)), cd to your git folder and run the command! Your logs will be copied to the clipboard.

### Command

```
gitlog {[-n NUM_COMMITS] [-b BRANCH] [-r REF] | -c COMMIT}  
```

### Options
- `-n NUM_COMMITS`

Limits log generation to NUM_COMMITS number of most recent commits on the branch. Defaults to all.

- `-b BRANCH`

Runs log generation on BRANCH. Defaults to the current, checked-out branch.

- `-r REF`

Runs log generation for the branch using REF as the comparison branch. Defaults to `origin/main`.

OR

- `-c COMMIT`

Runs log generation for a single, specified commit.

### Scenarios
#### General
If your branch is NOT currently checked out, then pass your branch name via `-b`.

If the branch you are merging into is NOT `origin/main`, then pass the branch name via `-r`.

#### After Merge + Branch Deleted
Specify the merge commit via `-c`. 

The default squash message should include all messages from individual commits. If you did not include the messages and they are required, try to restore the branch and proceed with the General scenario.
