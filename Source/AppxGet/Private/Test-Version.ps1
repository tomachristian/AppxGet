# Check whether $version meets the criteria defined in $RequiredVersion, $MinimumVersion and $MaximumVersion
function Test-Version {
    [CmdletBinding()]
    [OutputType([bool])]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNull()]
        $Version,

        [Parameter()]
        [string]
        $RequiredVersion,

        [Parameter()]
        [string]
        $MinimumVersion,

        [Parameter()]
        [string]
        $MaximumVersion
    )
    process {
        if (-not ($RequiredVersion -or $MinimumVersion -or $MaximumVersion)) {
            return $true
        }

        if ($RequiredVersion) {
            return ($Version -eq $RequiredVersion)
        }

        $isMatch = $false

        if ($MinimumVersion) {
            $isMatch = $Version -ge $MinimumVersion
        }

        if ($MaximumVersion) {
            if ($MinimumVersion) {
                $isMatch = $isMatch -and ($Version -le $MaximumVersion)
            }
            else {
                $isMatch = $Version -le $MaximumVersion
            }
        }

        return $isMatch
    }
}
