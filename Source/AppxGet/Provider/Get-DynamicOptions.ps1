# Defines PowerShell dynamic parameters so that a user can pass in parameters via OneGet to the provider
function Get-DynamicOptions {
    [CmdletBinding()]
    param (
        # See https://github.com/OneGet/oneget/wiki/OptionCategory
        [Microsoft.PackageManagement.MetaProvider.PowerShell.OptionCategory]
        $Category
    )

    switch ($Category) {
        Install {
            $ScopeDynamicOption = @{
                Name = "Scope"
                ExpectedType = "String"
                IsRequired = $false
                PermittedValues = @("CurrentUser", "AllUsers")
                Category = $Category
            }

            Write-Output -InputObject (New-DynamicOption @ScopeDynamicOption)

            $UserDynamicOption = @{
                Name = "User"
                ExpectedType = "String"
                IsRequired = $false
                Category = $Category
            }

            Write-Output -InputObject (New-DynamicOption @UserDynamicOption)

            $PackageTypeFilterDynamicOption = @{
                Name = "PackageTypeFilter"
                ExpectedType = "String"
                IsRequired = $false
                Category = $Category
            }

            Write-Output -InputObject (New-DynamicOption @PackageTypeFilterDynamicOption)

            $PublisherDynamicOption = @{
                Name = "Publisher"
                ExpectedType = "String"
                IsRequired = $false
                Category = $Category
            }

            Write-Output -InputObject (New-DynamicOption @PublisherDynamicOption)

            $PreserveApplicationDataDynamicOption = @{
                Name = "PreserveApplicationData"
                ExpectedType = "Switch"
                IsRequired = $false
                Category = $Category
            }

            Write-Output -InputObject (New-DynamicOption @PreserveApplicationDataDynamicOption)
        }
    }
}
