function Get-AppxPackageSoftwareIdentity {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 1, ValueFromPipeline = $true)]
        [object]
        $AppxPackage,

        [Parameter(Mandatory = $false)]
        [string]
        $RequiredVersion,

        [Parameter(Mandatory = $false)]
        [string]
        $MinimumVersion,

        [Parameter(Mandatory = $false)]
        [string]
        $MaximumVersion
    )
    process {
        $isMatch = Test-Version `
            -Version $_.Version `
            -RequiredVersion $RequiredVersion `
            -MinimumVersion $MinimumVersion `
            -MaximumVersion $MaximumVersion

        if (-not $isMatch) {
            return
        }

        $swidObject = @{
            FastPackageReference = $AppxPackage.PackageFullName
            Name = $AppxPackage.Name
            Version = $AppxPackage.Version
            versionScheme  = "MultiPartNumeric"
            Source = $script:PackageSource
        }

        if ($AppxPackage.InstallLocation) {
            $swidObject.Source = $AppxPackage.InstallLocation
        }

        New-SoftwareIdentity @swidObject
    }
}
