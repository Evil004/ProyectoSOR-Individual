
New-SmbShare -Name "Departamentos" -Path "E:/Departamentos" `
    -ReadAccess "hgandia\Gan_GL_R_DirDepartamentos"




New-SmbShare -Name "CyP" -Path "E:/Departamentos/CyP" `
    -ReadAccess "hgandia\Gan_GL_R_DirDepartamentos" `
    -ChangeAccess "hgandia\Gan_GL_RW_DirCyP"




New-SmbShare -Name "Informatica" -Path "E:/Departamentos/Informatica" `
    -ReadAccess "hgandia\Gan_GL_R_DirDepartamentos" `
    -ChangeAccess "hgandia\Gan_GL_RW_DirInformática"


New-SmbShare -Name "Enfermeria" -Path "E:/Departamentos/Enfermeria" `
    -ReadAccess "hgandia\Gan_GL_R_DirDepartamentos" `
    -ChangeAccess "hgandia\Gan_GL_RW_DirEnfermería"



New-SmbShare -Name "Argeologia" -Path "E:/Departamentos/Argeologia" `
    -ReadAccess "hgandia\Gan_GL_R_DirDepartamentos" `
    -ChangeAccess "hgandia\Gan_GL_RW_DirArgeológia"

pause