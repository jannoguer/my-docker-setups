$rawOutput = docker ps --format "{{.Names}}"
$containers = @($rawOutput -split '\r?\n' | Where-Object { $_ -match '\S' })

if (-not $containers -or $containers.Count -eq 0) {
    Write-Host "No running containers found." -ForegroundColor Red
    exit
}

Write-Host "Select a container to attach to:" -ForegroundColor Cyan
for ($i = 0; $i -lt $containers.Count; $i++) {
    Write-Host "[$i] $($containers[$i])"
}

[int]$idx = Read-Host "Enter index"

if ($idx -ge 0 -and $idx -lt $containers.Count) {
    Write-Host "Attaching to $($containers[$idx])..."
    docker exec -it $containers[$idx] sh
} else {
    Write-Host "Invalid selection." -ForegroundColor Red
}
