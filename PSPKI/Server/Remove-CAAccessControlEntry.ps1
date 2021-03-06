function Remove-CAAccessControlEntry {
<#
.ExternalHelp PSPKI.Help.xml
#>
[CmdletBinding()]
	param(
		[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[Alias('ACL')]
		[PKI.Security.AccessControl.CASecurityDescriptor[]]$InputObject,
		[Security.Principal.NTAccount[]]$User
	)
	process {
		foreach($ACL in $InputObject) {
			$User | ForEach-Object {
				$ACL.PurgeAccessRules($_)
			}
			$ACL
		}
	}
}