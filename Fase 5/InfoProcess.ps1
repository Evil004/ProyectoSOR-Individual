date >> C:/Logs/infoProcess.dat

echo "1. Lista de procesos que están cnsumiendo mas de 25 MB de memoria." >>C:/Logs/infoProcess.dat
echo "------------------------------------------------------------------------------------------------------" >> C:\Logs\infoProcess.dat

Get-Process | where {$_.virtualmemorysize -gt 250000000} | sort-object virtualmemorysize -descending >> C:\Logs\infoProcess.dat

echo "2. Lista de procesos cuya zona de memoria establecida para trabajar es mayor a 50MB." >>C:/Logs/infoProcess.dat

echo "------------------------------------------------------------------------------------------------------" >> C:\Logs\infoProcess.dat

(Get-Process).where{$_.WS-gt 100MB} >> C:\Logs\infoProcess.dat

echo "`n`n 3. Lista de todos los procesos que estan consumiendo mas del 5% del procesador.">> C:\Logs\infoProcess.dat

echo "------------------------------------------------------------------------------------------------------" >> C:\Logs\infoProcess.dat

Get-Process | Where-Object { $_.CPU -gt 10 } >> C:\Logs\infoProcess.dat

echo "4. Numero de procesos en ejecucion.">> C:\Logs\infoProcess.dat

echo "------------------------------------------------------------------------------------------------------" >> C:\Logs\infoProcess.dat

$Procesos = (Get-Process).count
echo "Hay $Procesos procesos en ejecucion" >> C:\Logs\infoProcess.dat