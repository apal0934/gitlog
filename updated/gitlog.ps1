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

$format = "format:%<|(9)Commit:%<|(9)%h%n%<|(8)Author:%<|(8)%an <%ae>%n%<|(8)Date:%<|(8)%cD%n%<|(8)Message:%<|(8)%s%w(0, 0, 9)%+b%-C()%n%w(0)----------------------------------------"

& "$PSScriptRoot\..\base.ps1" -n $commits -b $branch -r $ref -c $commit -f $format
