if (-not (Test-Path "E:/Modulos"))
{
    New-Item -Path "E:/Modulos" -ItemType Directory
}
if (-not (Test-Path "E:/Modulos/SOR"))
{
    New-Item -Path "E:/Modulos/SOR" -ItemType Directory
}

if (-not (Test-Path "E:/Modulos/SOR/Profesores"))
{
    New-Item -Path "E:/Modulos/SOR/Profesores" -ItemType Directory
}
if (-not (Test-Path "E:/Modulos/SOR/Profesores/Examenes"))
{
    New-Item -Path "E:/Modulos/SOR/Profesores/Examenes" -ItemType Directory
}
if (-not (Test-Path "E:/Modulos/SOR/Profesores/Notas"))
{
    New-Item -Path "E:/Modulos/SOR/Profesores/Notas" -ItemType Directory
}
if (-not (Test-Path "E:/Modulos/SOR/Alumnos"))
{
    New-Item -Path "E:/Modulos/SOR/Alumnos" -ItemType Directory
}
if (-not (Test-Path "E:/Modulos/SOR/Alumnos/Apuntes"))
{
    New-Item -Path "E:/Modulos/SOR/Alumnos/Apuntes" -ItemType Directory
}
if (-not (Test-Path "E:/Modulos/SOR/Alumnos/Comentarios"))
{
    New-Item -Path "E:/Modulos/SOR/Alumnos/Comentarios" -ItemType Directory
}
pause
