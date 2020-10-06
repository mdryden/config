# Re-syncs docker VM and windows host time caused by system sleep

Get-VMIntegrationService -VMName "DockerDesktopVM" -Name "Time Synchronization" | Disable-VMIntegrationService
Get-VMIntegrationService -VMName "DockerDesktopVM" -Name "Time Synchronization" | Enable-VMIntegrationService
