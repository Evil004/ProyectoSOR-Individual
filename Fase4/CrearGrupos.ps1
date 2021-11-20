New-ADGroup -Name Gan_GL_RW_DirArgeológia -GroupCategory Security -GroupScope DomainLocal -Path "OU=Argeologia,OU=Departamentos,DC=hgandia,DC=san-gva,DC=es"
New-ADGroup -Name Gan_GL_RW_DirInformática -GroupCategory Security -GroupScope DomainLocal -Path "OU=Informatica,OU=Departamentos,DC=hgandia,DC=san-gva,DC=es"
New-ADGroup -Name Gan_GL_RW_DirEnfermería -GroupCategory Security -GroupScope DomainLocal -Path "OU=Enfermeria,OU=Departamentos,DC=hgandia,DC=san-gva,DC=es"
New-ADGroup -Name Gan_GL_RW_DirCyP -GroupCategory Security -GroupScope DomainLocal -Path "OU=Comunicacion y prensa,OU=Departamentos,DC=hgandia,DC=san-gva,DC=es"
New-ADGroup -Name Gan_GL_R_DirDepartamentos -GroupCategory Security -GroupScope DomainLocal -Path "OU=Departamentos,DC=hgandia,DC=san-gva,DC=es"
New-ADGroup -Name Gan_GG_Departamentos -GroupCategory Security -GroupScope Global -Path "OU=Departamentos,DC=hgandia,DC=san-gva,DC=es"

Add-ADGroupMember -Identity Gan_GL_R_DirDepartamentos -Members Gan_GG_Argeológia
Add-ADGroupMember -Identity Gan_GL_R_DirDepartamentos -Members Gan_GG_CyP
Add-ADGroupMember -Identity Gan_GL_R_DirDepartamentos -Members Gan_GG_Enfermaría
Add-ADGroupMember -Identity Gan_GL_R_DirDepartamentos -Members Gan_GG_Informática


Add-ADGroupMember -Identity Gan_GL_RW_DirArgeológia -Members Gan_GG_Argeológia
Add-ADGroupMember -Identity Gan_GL_RW_DirCyP -Members Gan_GG_CyP
Add-ADGroupMember -Identity Gan_GL_RW_DirEnfermería -Members Gan_GG_Enfermaría
Add-ADGroupMember -Identity Gan_GL_RW_DirInformática -Members Gan_GG_Informática
Add-ADGroupMember -Identity Gan_GL_R_DirDepartamentos -Members Gan_GG_Departamentos

pause