#Renombrar el sistema
rename-computer iescamp-edu-es

#Obtener la configuracion de la interfaz de red
Get-NetIPConfiguration
#Obtener el adaptador de red
Get-NetAdapter

#Le ponemos la IP 192.168.1.202 en el adaptador de red 4
New-NetIPAddress -InterfaceIndex 7 -IPaddress 192.168.1.151 -PrefixLength 24 -DefaultGateway 192.168.1.201
#Le configuramos el DNS
Set-DnsClientServerAddress -InterfaceIndex 7 -ServerAddresses 192.168.1.201, 192.168.1.202

Get-NetAdapterBinding -ComponentID ‘ms_tcpip6’ | Disable-NetAdapterBinding -ComponentID ‘ms_tcpip6’ -PassThru

#Para ver la version del NTFS
fsutil fsinfo ntfsinfo C:\

#Ver de que servidor obtiene la hora nuestro windows
W32tm /query /configuration

#Establecemos un servidor personalizado del que obtener la hora
w32tm /config /manualpeerlist:"0.es.pool.ntp.org time.google.com" /syncfromflags:manual /update

#Comprobar que se han establecido los dos servidores correctamente
W32tm /query /configuration

#Comprobar que la fecha se ha establecido correctamente
get-date

#Para ver las particiones que ha creado Windows ejecutamso los siguientes comandos
#entramos a diskpart
diskpart
#Listamos los discos y seleccionamos el deseado
list disk
select disk 0
#Para ver las particiones
list partition
