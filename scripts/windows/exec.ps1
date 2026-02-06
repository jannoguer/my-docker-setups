$containers = docker ps --format "{{.Names}}" | Where-Object { $_ -ne "" }

if (-not $containers) {
    Write-Host "No running containers found." -ForegroundColor Red
    exit
}

Write-Host "Select a container to attach to:" -ForegroundColor Cyan
for ($i = 0; $i -lt $containers.Count; $i++) {
    Write-Host "[$i] $($containers[$i])"
}

$idx = Read-Host "Enter index"

if ($containers[$idx]) {
    Write-Host "Attaching to $($containers[$idx])..."
    docker exec -it $containers[$idx] sh
} else {
    Write-Host "Invalid selection." -ForegroundColor Red
}
