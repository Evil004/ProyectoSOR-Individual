#Fuente: https://gallery.technet.microsoft.com/scriptcenter/Menu-simple-en-PowerShell-95e1f923

#Paso de parámetros al ejecutar el script en la consola
#Este script recoje 2 parámetros en la llamada del mismo en la consola. 
#La ejecución del script será puede ser de dos formas:
#./menu.ps1 param1 param2
#o 
#./menu.ps1 -Param1 parametro1 -Param2 parametro2
#Los parámetros son opcionales, si la llamada es:./menu.ps1 --> los valores de $Param1 y $Param2, será la cadena de texto vacía.

function PromocionarCD {
     Write-Host "Ejecuto el comando para promocionar a CD"
    $dominioFQDN = "edu-gva.es"
    $dominioNETBIOS = "EDU-GVA"
    $adminPass = "Chubbyemu01"
    Import-Module ADDSDeployment
    Install-ADDSForest
    -CreateDnsDelegation:$False `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "Default" `
    -DomainName $dominioFQDN `
    -DomainNetbiosName $dominioNETBIOS `
    -SafeModeAdministratorPassword (ConvertTo-SecureString -string $adminPass -AsPlainText -Force) `
    -ForestMode "Default" `
    -InstallDns:$True `
    -LogPath "C:\Windows\NTDS" `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true
}

function DespromocionarCD {
     Write-Host "Ejecuto el comando para despromocionar el CD"
    Import-Module ADDSDeployment
    Uninstall-ADDSDomainController -DemoteOperationMasterRole:$true -ForceRemoval:$true -Force:$true
}

function GetSSID {
     Get-LocalUser |Select-Object -First 1 -ExpandProperty SID | Write-Host
}

function PromocionarSub {
     if (!(Get-Module -Name ActiveDirectory)) #Accederá al then solo si no existe una entrada llamada ActiveDirectory
     {
     Import-Module ActiveDirectory #Se carga el módulo
     }

     #Se comprueba si se tiene cargado el módulo ADDSDeployment y si no es así, lo carga.

     if (!(Get-Module -Name ADDSDeployment)) #Se comprueba si se tiene cargado el módulo
     {
     Import-Module ADDSDeployment #Se carga el módulo
     }
     
     Install-WindowsFeature –Name AD-Domain-Services –IncludeManagementTools

     $NombreNuevoDominio = Read-Host "Introduce el nuevo nombre de dominio: " 
     $NombreDominioPadre = Read-Host "Introduce el nombre de dominio del padre: "
     Import-Module ADDSDeployment
     Install-ADDSDomain `
     -NoGlobalCatalog:$false `
     -CreateDnsDelegation:$true `
     -Credential (Get-Credential) `
     -DatabasePath "C:\Windows\NTDS" `
     -DomainMode "WinThreshold" `
     -DomainType "ChildDomain" `
     -InstallDns:$true `
     -LogPath "C:\Windows\NTDS" `
     -NewDomainName $NombreNuevoDominio  `
     -NewDomainNetbiosName $NewDomainName.ToUpper()  `
     -ParentDomainName $NombreDominioPadre `
     -SiteName "Default-First-Site-Name" `
     -SysvolPath "C:\Windows\SYSVOL" `
     -Force:$true
}

function DespromocionarSub {
     if (!(Get-Module -Name ADDSDeployment)){
          Import-Module ADDSDeployment #Se carga el módulo
     }
     Uninstall-ADDSDomainController -DemoteOperationMasterRole:$true -ForceRemoval:$true -Force:$true
     Uninstall-WindowsFeature -Name AD-Domain-Services, DNS -Confirm:$false
}

function RelacionConfianza {
     Nltest /DOMAIN_TRUSTS | Write-Host
     
}


#Función que nos muestra un menú por pantalla con 3 opciones y una última para salir del mismo
# La función “mostrarMenu”, puede tomar como parámetro un título y devolverá por pantalla 
# "================ $Titulo================" , donde $Titulo será el título pasado por parámetro.
#Si no se le pasa un parámetro, por defecto $Titulo contendrá la cadena 'Selección de opciones'  
#https://technet.microsoft.com/es-es/library/jj554301.aspx
function mostrarMenu { 
     
     param ( 
          [string]$Titulo = 'Seleccion de opciones' 
     ) 
     Clear-Host 
     Write-Host "================ $Titulo================" 
      
     
     Write-Host "1) Promocionar CD" 
     Write-Host "2) Despromocionar CD"  
     Write-Host "3) Usuario y SSID"  
     Write-Host ""
     Write-Host "4) Opciones Subdominio"
     Write-Host ""
     Write-Host "S) Presiona 'S' para salir" 

    

     #Recogemos en la varaible input, el valor que el usuario escribe por teclado (opción del menú)
     $input = Read-Host "Elegir una Opcion"

     #https://ss64.com/ps/switch.html
     switch ($input) { 
          '1' { 
               Clear-Host
               PromocionarCD
               pause
          } 
          '2' { 
               Clear-Host  
               DespromocionarCD
               pause
          } 
          '3' { 
               Clear-Host  
               GetSSID
               pause
          } 
          '4' { 
               Clear-Host 
               do {
                    $inputSub = MenuSubdominio
               }until($inputSub -eq 's')
               
          } 

          's' {
               'Saliendo del script...'
               return $input
          } 
          #Si no se selecciona una de las opciones del menú, es decir, se pulsa algun carácter
          #que no sea 1, 2, 3 o s, sacamos por pantalla un aviso e indicamos lo que hay que realizar.
          default { 
               Write-Host 'Por favor, Pulse una de las opciones disponibles [1-3] o s para salir'
               pause
          }
     }
}

function MenuSubdominio { 
     param ( 
          [string]$Titulo = 'Opciones Subdominio', 
          [string]$Titulo2 = 'Individual by Oscar' 
     ) 
     Clear-Host 
     Write-Host "================ $Titulo ================"
     Write-Host "================ $Titulo2 ================" 
      
     
     Write-Host "1) Promocionar a subdominio" 
     Write-Host "2) Despromocionar de subdominio" 
     Write-Host "3) Usuario y SSID" 
     Write-Host "4) Comprobar relaciones de confianza"
     Write-Host ""
     Write-Host "S) Presiona 'S' para  volver a las opciones principales" 

    

     #Recogemos en la varaible input, el valor que el usuario escribe por teclado (opción del menú)
     $input = Read-Host "Elegir una Opcion"  

     #https://ss64.com/ps/switch.html
     switch ($input) { 
          '1' { 
               Clear-Host  
               PromocionarSub
               pause
          } '2' { 
               Clear-Host  
               DespromocionarSub
               pause
          } '3' { 
               Clear-Host  
               GetSSID
               pause
          } '4' { 
               Clear-Host  
               RelacionConfianza
               pause
          }'s' {
               'Saliendo del script...'
               return $input
          } 
          #Si no se selecciona una de las opciones del menú, es decir, se pulsa algun carácter
          #que no sea 1, 2, 3 o s, sacamos por pantalla un aviso e indicamos lo que hay que realizar.
          default { 
               'Por favor, Pulse una de las opciones disponibles [1-3] o s para salir'
          }
     }

}
#Bucle principal del Script. El bucle se ejecuta de manera infinita hasta que se cumple
#la condición until ($input -eq 's'), es decir, hasta que se pulse la tecla s.
do { 
     #Llamamos a la función mostrarMenu, para dibujar el menú de opciones por pantalla
     
     $input = mostrarMenu 
} 
until ($input -eq 's')
