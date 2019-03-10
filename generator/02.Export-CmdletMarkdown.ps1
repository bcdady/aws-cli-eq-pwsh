#Requires -Version 6.0
Import-Module AWSPowerShell.NetCore

# 
$cmdletVersion = Get-Module AWSPowerShell.NetCore | ForEach-Object { $_.Version.ToString() }

# import service metadata
. .\02.ServiceMetadata.ps1 

# clear markdown directory
Remove-Item -Path ".\markdown\*.md" -Force

# functions
function Write-HostInfo () {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline=$true, Mandatory=$true)]
        [string]$Message
    )
    Write-Host $Message -ForegroundColor Green
}

function Export-TopPageMarkdown {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$CLIVersionMetadataPath,
        [Parameter(Mandatory=$true)]
        [string]$CLIMetadataPath
    )
    return & {
        "---"
        "title: AWS CLI -eq PowerShell"
        "date: $((Get-Date).ToString('yyyy-MM-dd'))"
        "---"
        ""
        "<br/>"
        "This is the lists of AWS PowerShell Cmdlets equivalent with AWS CLI commands."
        "<br/>"
        ""
        "### Version"
        ""
        "* AWS CLI : {0}" -f (Get-Content -LiteralPath $CLIVersionMetadataPath -Encoding ascii)
        "* AWS Tools for PowerShell : {0}" -f $cmdletVersion
        ""
        "### Summary"
        ""
        "|Service|CLI sub command|PowerShell prefix|Notes|"
        "|----|----|----|----|"
        foreach ($command in $(Get-Content -LiteralPath $CLIMetadataPath -Encoding ascii)) {
            $metadata = $g_AWSServices[$command]
            $displayName = ''
            $displayUrl = ''
            $cmdletPrefix = $metadata.Prefix
            $note = $metadata.Note
            if ($null -ne $metadata -and '' -ne $metadata.Name) {
                $displayName = $metadata.Name
                $displayUrl = $metadata.Url
            }
            $displayColumn = if($displayUrl -eq '') {"$displayName"} else {"[$displayName]($displayUrl)"}
            "|$displayColumn|[$command]({{%relref ""post/$command.md"" %}})|$cmdletPrefix|$note|"
        }
    }
}

function Export-PostPageMarkdown {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$ServiceName,
        [Parameter(Mandatory=$true)]
        [Object[]]$Commands
    )

    # output markdown
    $metadata = $g_AWSServices[$ServiceName]
    $displayName = $ServiceName
    $displayUrl = 'https://aws.amazon.com/'
    if ($null -ne $metadata -and '' -ne $metadata.Name) {
        $displayName = $metadata.Name
        $displayUrl = $metadata.Url
    }
    $markdown = if ($null -eq $Commands) {
        & {
            "---"
            "title: $ServiceName"
            "date: $((Get-Date).ToString('yyyy-MM-dd'))"
            "---"
            ""
            "## $ServiceName"
            ""
            "### [$displayName]($displayUrl)"
            ""
            "* No CLI commands"
            ""
        } | Out-String
    } else {
        & {
            "---"
            "title: $ServiceName"
            "date: $((Get-Date).ToString('yyyy-MM-dd'))"
            "---"
            ""
            "## $ServiceName"
            ""
            "### [$displayName]($displayUrl)"
            ""
            "* [CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/$ServiceName/index.html)"
            ""
            "|AWS CLI|PowerShell Cmdlet|Prefix|"
            "|----|----|:--:|"
            foreach ($c in $Commands) {
                if ($c.CmdLet) {
                    "|[$($c.CLI)]($($c.CLIUrl))|[$($c.CmdLet)]($($c.CmdletUrl))|$($c.Prefix)|"
                }
                else {
                    "|[$($c.CLI)]($($c.CLIUrl))||$($c.Prefix)|"
                }
            }
        } | Out-String
    }
    return $markdown
}

function Get-CLISubCommands {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$CommandFilePath,
        [Parameter(Mandatory=$true)]
        [string]$ServiceName
    )
    $commands = Get-Content -LiteralPath $CommandFilePath | ForEach-Object {
        try {
            # AWS CLIのサブコマンドを直接指定してもダメなものが結構ある
            $awsCLI = $_
            $searchCLI = $_
            if ($null -ne $g_SubCommandAlias[$ServiceName]) {
                $searchCLI = $_ -replace "aws $ServiceName", "aws $($g_SubCommandAlias[$ServiceName])"
            }
            # 1つの AwsCliCommand から複数の Cmdlet を返す場合がある
            $awsCLISubcommandName = ($awsCLI -replace "aws $ServiceName", "").Trim()
            $awsCLIUrl = "https://docs.aws.amazon.com/cli/latest/reference/$ServiceName/$awsCLISubcommandName.html"
            $cmdletNames = Get-AWSCmdletName -AwsCliCommand $searchCLI
            if($null -eq $cmdletNames) {
                $o = [PSCustomObject]@{
                    CLI              = $awsCLI
                    CLISubCommand    = $awsCLISubcommandName
                    CLIUrl           = $awsCLIUrl
                    CmdLet           = ''
                    CmdletUrl        = ''
                    ServiceName      = '' 
                    Prefix           = ''
                    ServiceOperation = ''
                }
                Write-Output $o
            } else {
                $cmdletNames | ForEach-Object {
                    $o = [PSCustomObject]@{
                        CLI              = $awsCLI
                        CLISubCommand    = $awsCLISubcommandName
                        CLIUrl           = $awsCLIUrl
                        CmdLet           = ''
                        CmdletUrl        = ''
                        ServiceName      = '' 
                        Prefix           = ''
                        ServiceOperation = ''
                    }
                    $o.Cmdlet = $_.CmdletName
                    $o.CmdletUrl = "https://docs.aws.amazon.com/powershell/latest/reference/items/$($_.CmdletName).html"
                    $o.Prefix = $_.CmdletNounPrefix
                    $o.ServiceName = $_.ServiceName
                    $o.ServiceOperation = $_.ServiceOperation
                    Write-Output $o
                }
            }
        }
        catch {
            $o = [PSCustomObject]@{
                CLI              = $awsCLI
                CLISubCommand    = $awsCLISubcommandName
                CLIUrl           = $awsCLIUrl
                CmdLet           = ''
                CmdletUrl        = ''
                ServiceName      = '' 
                Prefix           = ''
                ServiceOperation = ''
            }
            Write-Output $o
        }
    }
    return $commands
}

# export top page
'Export top page...' | Write-HostInfo
Export-TopPageMarkdown -CLIVersionMetadataPath '.\temp\_cli.version.cfg' -CLIMetadataPath '.\temp\_cli.metadata.cfg' | 
    Out-File -FilePath ".\markdown\_index.md"

# export each subcommands pages
Get-ChildItem ".\temp\*.txt" | ForEach-Object {
    "Exporting $($_.BaseName)..." | Write-HostInfo
    $serviceName = $_.BaseName
    #
    $commands = Get-CLISubCommands -CommandFilePath ($_.FullName) -ServiceName $serviceName
    # output markdown
    Export-PostPageMarkdown -ServiceName $serviceName -Commands $commands |
        Out-File -FilePath ".\markdown\$($_.BaseName).md"
}
