@{
    # Script module or binary module file associated with this manifest.
    RootModule = 'AppxGet.psm1'

    # Version number of this module.
    ModuleVersion = '0.1.0.1'

    # ID used to uniquely identify this module.
    GUID = 'ebe9a855-3bb5-4b68-a660-ddae875874f0'

    # Author of this module.
    Author = 'Cristian Paul Toma'

    # Company or vendor of this module.
    CompanyName = 'TCP'

    # Copyright statement for this module.
    Copyright = ''

    # Description of the functionality provided by this module.
    Description = 'Powershell Package Management (aka OneGet) Provider for AppX packages.'

    # Minimum version of the Windows PowerShell engine required by this module.
    PowerShellVersion = '3.0'

    # Modules that must be imported into the global environment prior to importing this module.
    RequiredModules = @('PackageManagement')

    # Functions to export from this module, for best performance,
    # do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @()

    # Cmdlets to export from this module, for best performance,
    # do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module, for best performance,
    # do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess.
    # This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{
        PackageManagementProviders = 'AppxGetProvider.psm1'

        PSData = @{
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @("PackageManagement", "Provider", "AppX", "WindowsStore", "Windows")

            # A URL to the license for this module.
            LicenseUri = 'https://raw.githubusercontent.com/tomachristian/AppxGet/master/LICENSE'

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/tomachristian/AppxGet'

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            # ReleaseNotes = ''
        }
    }

    # HelpInfo URI of this module
    HelpInfoURI = 'https://github.com/tomachristian/AppxGet/wiki'
}
