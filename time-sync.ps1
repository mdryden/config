# Re-syncs docker VM and windows host time caused by system sleep
# You might need to run this in an admin powershell prompt:
# Set-ExecutionPolicy RemoteSigned

Get-VMIntegrationService -VMName "DockerDesktopVM" -Name "Time Synchronization" | Disable-VMIntegrationService
Get-VMIntegrationService -VMName "DockerDesktopVM" -Name "Time Synchronization" | Enable-VMIntegrationService
