﻿$DC = "10.0.0.11"
$pass = ConvertTo-SecureString -String "Hyper-v_vergelijken" -AsPlainText -force

$ADUsers = Get-ADUser -server $DC -Filter * -Credential $creds2 -Properties * 
$acl = Get-Acl -Path C:\shared\users\$($ADUser.sAMAccountname)
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule($($ADUser.sAMAccountname), 'Modify', 'ContainerInherit,ObjectInherit', 'None', 'Allow')
$acl.SetAccessRule($Ar)
Set-Acl -Path C:\shared\users\$($ADUser.sAMAccountname) -AclObject $acl