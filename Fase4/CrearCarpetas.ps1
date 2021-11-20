if (-not (Test-Path "E:/Departamentos"))
{
    New-Item -Path "E:/Departamentos" -ItemType Directory
}
if (-not (Test-Path "E:/Departamentos/Enfermeria"))
{
    New-Item -Path "E:/Departamentos/Enfermeria" -ItemType Directory
}
if (-not (Test-Path "E:/Departamentos/Argeologia"))
{
    New-Item -Path "E:/Departamentos/Argeologia" -ItemType Directory
}
if (-not (Test-Path "E:/Departamentos/Informatica"))
{
    New-Item -Path "E:/Departamentos/Informatica" -ItemType Directory
}
if (-not (Test-Path "E:/Departamentos/CyP"))
{
    New-Item -Path "E:/Departamentos/CyP" -ItemType Directory
}

pause