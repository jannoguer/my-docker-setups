Write-Host "Starting Safe Clean..." -ForegroundColor Cyan
Write-Host "NOTE: Stopped containers will be PRESERVED." -ForegroundColor Yellow
Write-Host "";

Write-Host "--- Pruning Unused Images ---" -ForegroundColor Cyan
docker image prune -a --force

Write-Host "--- Pruning Unused Volumes ---" -ForegroundColor Cyan
docker volume prune --force

Write-Host "--- Pruning Unused Networks ---" -ForegroundColor Cyan
docker network prune --force

Write-Host "--- Pruning Build Cache ---" -ForegroundColor Cyan
docker builder prune --force

Write-Host "";
Write-Host "Cleanup complete." -ForegroundColor Green
