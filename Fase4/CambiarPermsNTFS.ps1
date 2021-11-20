icacls E:/Departamentos /GRANT hgandia\Gan_GL_R_DirDepartamentos:RX /t
icacls E:/Departamentos/Enfermeria /GRANT hgandia\Gan_GL_RW_DirEnfermería:RXW
icacls E:/Departamentos/Argeologia /GRANT hgandia\Gan_GL_RW_DirArgeológia:RXW
icacls E:/Departamentos/Informatica /GRANT hgandia\Gan_GL_RW_DirInformática:RXW
icacls E:/Departamentos/CyP /GRANT hgandia\Gan_GL_RW_DirCyP:RXW

icacls E:/Departamentos /inheritance:d /T
icacls E:/Departamentos /remove:g Usuarios
icacls E:/Departamentos/Enfermeria /inheritance:d /T
icacls E:/Departamentos/Enfermeria /remove:g Usuarios
icacls E:/Departamentos/Argeologia /inheritance:d /T
icacls E:/Departamentos/Argeologia /remove:g Usuarios
icacls E:/Departamentos/Informatica /inheritance:d /T
icacls E:/Departamentos/Informatica /remove:g Usuarios
icacls E:/Departamentos/CyP /inheritance:d /T
icacls E:/Departamentos/CyP  /remove:g Usuarios



pause