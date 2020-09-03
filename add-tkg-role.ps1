$cvRole = "TKG-Role-Test"
$cvRolePermFile = "tkg-cli-role.txt"
$viserver = "10.0.0.15"
Connect-VIServer -server $viServer
$cvRoleIds = @()
Get-Content $cvRolePermFile | Foreach-Object{
    $cvRoleIds += $_
}
New-VIRole -name $cvRole -Privilege (Get-VIPrivilege -Server $viserver -id $cvRoleIds) -Server $viserver
