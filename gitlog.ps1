param 
(
    [Alias("n", "num")]
    [int]$commits = 0,

    [Alias("b")]
    [string]$branch = "",

    [Alias("r")]
    [string]$ref = "origin/main",

    [Alias("c")]
    [string]$commit = ""
)

$OutputEncoding = [System.Text.UTF8Encoding]::new()
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

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

$format = "format:________________________________________%n%<|(8)Commit:%<|(8)%h%n%<|(8)Author:%<|(8)%an <%ae>%n%<|(8)Date:%<|(8)%cD%n%<|(8)Message:%<|(8)%s%w(0, 0, 9)%+b%-C()%n%n%w(0)Changes:"

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
