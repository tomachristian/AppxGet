function Find-AppxPackage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $PackageFullName
    )
    process {
        Get-AppxPackage | Where-Object { $_.PackageFullName -eq $PackageFullName }
    }
}
