Set-ADOrganizationalUnit -Identity "OU=Departamentos,DC=hgandia,DC=san-gva,DC=es" -ProtectedFromAccidentalDeletion $false
Remove-ADOrganizationalUnit -Identity "OU=Departamentos,DC=hgandia,DC=san-gva,DC=es" -Recursive
pause