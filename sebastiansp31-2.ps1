# Script para mostrar los inicios de sesion entre dos fechas

# Recibimos la fecha de inicio y la fecha de fin como parametros
param(
    [datetime]$Inicio,
    [datetime]$Fin
)

# Buscamos los eventos de inicio de sesion del registro de Seguridad
Get-WinEvent -FilterHashtable @{
    LogName = 'Security'
    Id = 4624
    StartTime = $Inicio
    EndTime = $Fin
} | ForEach-Object {

    # Convertimos el evento a XML para poder obtener el nombre del usuario
    $xml = [xml]$_.ToXml()

    # Guardamos el nombre del usuario que inicio sesion
    $usuario = ($xml.Event.EventData.Data | Where-Object {$_.Name -eq 'TargetUserName'}).'#text'

    # Mostramos el evento si el usuario no es SYSTEM
    if ($usuario -ne 'SYSTEM') {
        Write-Host "Fecha:" $_.TimeCreated "- Usuario:" $usuario
    }
}
