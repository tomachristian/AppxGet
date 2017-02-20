# See https://technet.microsoft.com/itpro/powershell/windows/appx/get-appxpackage
function Get-InstalledPackage {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Name,

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
        $Options = $request.Options
        $GetAppxArgumentList = @{}

        # Name Parameter
        if ($Name) {
            $GetAppxArgumentList.Name = $Name
        }

        # User/AllUsers Parameter
        if ($Options.ContainsKey("Scope")) {
            if ($Options.Scope -eq "AllUsers") {
                $GetAppxArgumentList.AllUsers = $true
            }
            elseif ($Options.Scope -eq "CurrentUser") {
                $CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
                $GetAppxArgumentList.User = $CurrentUser
            }
        }
        elseif ($Options.ContainsKey("User")) {
            $GetAppxArgumentList.User = $Options.User
        }

        # PackageTypeFilter Parameter
        if ($Options.ContainsKey("PackageTypeFilter")) {
            $GetAppxArgumentList.PackageTypeFilter = $Options.PackageTypeFilter
        }

        # Publisher Parameter
        if ($Options.ContainsKey("Publisher")) {
            $GetAppxArgumentList.Publisher = $Options.Publisher
        }

        Get-AppxPackage @GetAppxArgumentList | Get-AppxPackageSoftwareIdentity `
            -RequiredVersion $RequiredVersion `
            -MinimumVersion $MinimumVersion `
            -MaximumVersion $MaximumVersion
    }
}
