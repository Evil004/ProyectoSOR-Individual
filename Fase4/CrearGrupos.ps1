New-ADGroup -Name Gan_GL_RW_DirArgeol�gia -GroupCategory Security -GroupScope DomainLocal -Path "OU=Argeologia,OU=Departamentos,DC=hgandia,DC=san-gva,DC=es"
New-ADGroup -Name Gan_GL_RW_DirInform�tica -GroupCategory Security -GroupScope DomainLocal -Path "OU=Informatica,OU=Departamentos,DC=hgandia,DC=san-gva,DC=es"
New-ADGroup -Name Gan_GL_RW_DirEnfermer�a -GroupCategory Security -GroupScope DomainLocal -Path "OU=Enfermeria,OU=Departamentos,DC=hgandia,DC=san-gva,DC=es"
New-ADGroup -Name Gan_GL_RW_DirCyP -GroupCategory Security -GroupScope DomainLocal -Path "OU=Comunicacion y prensa,OU=Departamentos,DC=hgandia,DC=san-gva,DC=es"
New-ADGroup -Name Gan_GL_R_DirDepartamentos -GroupCategory Security -GroupScope DomainLocal -Path "OU=Departamentos,DC=hgandia,DC=san-gva,DC=es"
New-ADGroup -Name Gan_GG_Departamentos -GroupCategory Security -GroupScope Global -Path "OU=Departamentos,DC=hgandia,DC=san-gva,DC=es"

Add-ADGroupMember -Identity Gan_GL_R_DirDepartamentos -Members Gan_GG_Argeol�gia
Add-ADGroupMember -Identity Gan_GL_R_DirDepartamentos -Members Gan_GG_CyP
Add-ADGroupMember -Identity Gan_GL_R_DirDepartamentos -Members Gan_GG_Enfermar�a
Add-ADGroupMember -Identity Gan_GL_R_DirDepartamentos -Members Gan_GG_Inform�tica


Add-ADGroupMember -Identity Gan_GL_RW_DirArgeol�gia -Members Gan_GG_Argeol�gia
Add-ADGroupMember -Identity Gan_GL_RW_DirCyP -Members Gan_GG_CyP
Add-ADGroupMember -Identity Gan_GL_RW_DirEnfermer�a -Members Gan_GG_Enfermar�a
Add-ADGroupMember -Identity Gan_GL_RW_DirInform�tica -Members Gan_GG_Inform�tica
Add-ADGroupMember -Identity Gan_GL_R_DirDepartamentos -Members Gan_GG_Departamentos

pause