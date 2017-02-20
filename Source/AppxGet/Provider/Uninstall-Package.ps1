# See https://technet.microsoft.com/en-us/itpro/powershell/windows/appx/remove-appxpackage
function Uninstall-Package {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $FastPackageReference
    )
    process {
        [Microsoft.Windows.Appx.PackageManager.Commands.AppxPackage] $AppxPackage = `
            Find-AppxPackage -PackageFullName $FastPackageReference

        if (!$AppxPackage) {
            Write-Error "Package not found using '$FastPackageReference'"
            return
        }

        $RemoveAppxArgumentList = @{
            Package = $AppxPackage
            Confirm = $false
        }

        $Options = $request.Options

        # PreserveApplicationData Parameter
        if ($Options.ContainsKey("PreserveApplicationData")) {
            $RemoveAppxArgumentList.PreserveApplicationData = $Options.PreserveApplicationData
        }

        Remove-AppxPackage @RemoveAppxArgumentList

        $AppxPackage | Get-AppxPackageSoftwareIdentity
    }
}
