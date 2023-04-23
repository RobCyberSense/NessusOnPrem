# Remove the Windows Management Instrumentation (WMI) inbound rule
$wmiRule = Get-NetFirewallRule -DisplayName "Windows Management Instrumentation (WMI)"
if ($wmiRule -ne $null) {
    Remove-NetFirewallRule -DisplayName "Windows Management Instrumentation (WMI)"
}

# Remove the File and Printer Sharing inbound rule
$filePrintRule = Get-NetFirewallRule -DisplayName "File and Printer Sharing"
if ($filePrintRule -ne $null) {
    Remove-NetFirewallRule -DisplayName "File and Printer Sharing"
}

# Set the Remote Registry service startup type to Automatic
Set-Service -Name RemoteRegistry -StartupType Disabled

# Remove the LocalAccountTokenFilterPolicy registry key
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$registryName = "LocalAccountTokenFilterPolicy"
if (Test-Path "$registryPath\$registryName") {
    Remove-ItemProperty -Path $registryPath -Name $registryName
}