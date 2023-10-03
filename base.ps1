param 
(
    [Alias("n", "num")]
    [int]$commits = 0,

    [Alias("b")]
    [string]$branch = "",

    [Alias("r")]
    [string]$ref = "origin/main",

    [Alias("c")]
    [string]$commit = "",

    [Alias("f")]
    [string]$format = ""
)

$OutputEncoding = [System.Text.UTF8Encoding]::new()
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

if ($format -eq "") 
{
    echo "Error retrieving format"
    exit 1
}

if ($branch -eq "")
{
    $branch = git branch --show-current
    if ($? -eq $false)
    {
        echo "Error getting current branch - is your working directory a valid repository?"
        exit 1
    }
}

$branch_arg = "$ref..$branch"

if ($commits -gt 0)
{
    $num_commits = "-$commits"
}

if ($commit -ne "")
{
    $log = git show --format=$format --name-status -m $commit
}
else
{
    $log = git log $num_commits --pretty=$format --name-status $branch_arg --
}

if ($? -eq $false)
{
    echo "Error retrieving git logs!"
    exit 1
}

if ($log -eq $null)
{
    echo "No changes to copy!"
    exit
}

Set-Clipboard -Value $log

if ($? -eq $false)
{
    echo "Error setting clipboard! Please copy manually:"
    echo $log
    exit 1
}

echo "Copied logs to clipboard!"
