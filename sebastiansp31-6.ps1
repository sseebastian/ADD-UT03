# Ruta del script que guardara los servicios activos
$rutaScript = "C:\Mantenimiento\servicios.ps1"

# Creamos el script que obtiene los servicios en ejecucion
'Get-Service | Where-Object {$_.Status -eq "Running"} | Out-File C:\Mantenimiento\servicios_activos.txt' |
Out-File $rutaScript

# Definimos la accion de la tarea
$accion = New-ScheduledTaskAction `
    -Execute "powershell.exe" `
    -Argument "-File C:\Mantenimiento\servicios.ps1"

# Definimos el desencadenador diario a las 19:00
$desencadenador = New-ScheduledTaskTrigger `
    -Daily `
    -At 19:00

# Registramos la tarea programada
Register-ScheduledTask `
    -TaskName "Comprobar servicios activos" `
    -Action $accion `
    -Trigger $desencadenador `
    -Description "Guarda diariamente los servicios activos del servidor"