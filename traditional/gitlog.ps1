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

$format = "format:Revision: %h%nAuthor: %an <%ae>%nDate: %cD%nMessage:%+B%-C()%n----"

& "$PSScriptRoot\..\base.ps1" -n $commits -b $branch -r $ref -c $commit -f $format
