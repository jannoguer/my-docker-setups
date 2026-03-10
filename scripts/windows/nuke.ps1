Write-Host "WARNING: This will STOP and DELETE all containers, images, volumes, and networks." -ForegroundColor Red
$confirm1 = Read-Host "Are you sure you want to nuke everything? (y/N)"

if ($confirm1 -match "^[Yy]$") {
    Write-Host "LAST CHANCE: This action CANNOT be undone." -ForegroundColor DarkRed
    $confirm2 = Read-Host "Are you ABSOLUTELY sure you want to proceed? (y/N)"
    
    if ($confirm2 -match "^[Yy]$") {
        Write-Host "Stopping all containers..." -ForegroundColor Cyan
        $containers = @(docker ps -aq)
        if ($containers.Count -gt 0) { 
            docker stop $containers 
            docker rm $containers 
        }

        Write-Host "Running full system prune..." -ForegroundColor Cyan
        docker system prune -a --volumes --force
        
        Write-Host ""
        Write-Host "Nuke complete. Clean slate achieved." -ForegroundColor Green
    } else {
        Write-Host "Aborted at the final step. Your containers are safe." -ForegroundColor Yellow
    }
} else {
    Write-Host "Aborted. Your containers live to see another day." -ForegroundColor Yellow
}
