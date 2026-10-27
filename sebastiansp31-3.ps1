# Script para consultar los registros de eventos de Windows

# Obtenemos los registros de eventos que tienen eventos guardados
$registros = Get-WinEvent -ListLog * | Where-Object {$_.RecordCount -gt 0}

# Variable para controlar el menu
$opcion = -1

while ($opcion -ne 0) {

    Clear-Host
    Write-Host "===== REGISTROS DE EVENTOS ====="

    # Mostramos los registros disponibles con un numero
    for ($i = 0; $i -lt $registros.Count; $i++) {
        Write-Host "$($i + 1). $($registros[$i].LogName)"
    }

    Write-Host "0. Salir"

    # Leemos la opcion elegida y la convertimos a numero
    $opcion = [int](Read-Host "Elige una opcion")

    if ($opcion -eq 0) {

        Write-Host "Saliendo..."

    }
    elseif ($opcion -ge 1 -and $opcion -le $registros.Count) {

        # Guardamos el registro seleccionado
        $registro = $registros[$opcion - 1]

        Write-Host ""
        Write-Host "Registro:" $registro.LogName
        Write-Host "Numero de eventos:" $registro.RecordCount
        Write-Host ""
        Write-Host "Ultimos 12 eventos:"

        # Mostramos los 12 eventos mas recientes del registro elegido
        Get-WinEvent -LogName $registro.LogName -MaxEvents 12 |
        Select-Object TimeCreated, Id, LevelDisplayName, ProviderName |
        Format-Table -AutoSize |
        Out-Host

        Pause

    }
    else {

        # Avisamos si se introduce una opcion que no existe
        Write-Host "Opcion no valida"
        Pause
    }
}
