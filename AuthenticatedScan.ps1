# Define the IP address to allow access
$allowedIP = "192.168.0.247"

# Get the Windows Management Instrumentation (WMI) inbound rule
$wmiRule = Get-NetFirewallRule -DisplayName "Windows Management Instrumentation (WMI)"

# If the WMI rule exists, add the IP address restriction
if ($wmiRule -ne $null) {
    $wmiRule | Set-NetFirewallRule -RemoteAddress $allowedIP
}
# If the WMI rule doesn't exist, create it with the IP address restriction
else {
    New-NetFirewallRule -DisplayName "Windows Management Instrumentation (WMI)" -Direction Inbound -Protocol TCP -LocalPort 135 -Program "System" -Action Allow -RemoteAddress $allowedIP
}

# Get the File and Printer Sharing inbound rule
$filePrintRule = Get-NetFirewallRule -DisplayName "File and Printer Sharing"

# If the File and Printer Sharing rule exists, add the IP address restriction
if ($filePrintRule -ne $null) {
    $filePrintRule | Set-NetFirewallRule -RemoteAddress $allowedIP
}
# If the File and Printer Sharing rule doesn't exist, create it with the IP address restriction
else {
    New-NetFirewallRule -DisplayName "File and Printer Sharing" -Direction Inbound -Protocol TCP -LocalPort 139,445 -Program "%SystemRoot%\system32\svchost.exe" -Service "LanmanServer" -Action Allow -RemoteAddress $allowedIP
}

# Set the Remote Registry service startup type to Manual
Set-Service -Name RemoteRegistry -StartupType Manual

# Add the LocalAccountTokenFilterPolicy registry key with value 1
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$registryName = "LocalAccountTokenFilterPolicy"
$registryValue = 1
New-ItemProperty -Path $registryPath -Name $registryName -Value $registryValue -PropertyType DWORD -Force