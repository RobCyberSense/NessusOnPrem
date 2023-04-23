<h1>Nessus Professional - Authenticated Scanning for On-Premise Computers</h1>

<h3>Introduction</h3>
If you're using Nessus Professional to perform authenticated scans on on-premise Windows computers, you may encounter issues with the default firewall rules preventing Nessus from accessing the required services. To make things easier, this repository provides scripts to quickly configure the required firewall rules, as well as to revert the settings afterwards.

<h3>Requirements</h3>
<ul><li>Nessus Professional</li>
<li>PowerShell (version 3.0 or higher)</li>
<li>Administrator access to the target computer(s)</li></ul>

<h3>Usage</h3>

<strong>Configuring Firewall Rules</strong>

To configure the necessary firewall rules for an authenticated scan, follow these steps:
1. Clone or download the repository to your computer.
2. Open PowerShell as an administrator.
3. Navigate to the location of the cloned or downloaded repository.
4. Run the <strong>Configure-Firewall.ps1</strong> script with the following parameters:
<strong>-allowedIP</strong>: The IP address that should be allowed to access the required services. This can be a single IP address or a comma-separated list of IP addresses.
Example: .\Configure-Firewall.ps1 -allowedIP "192.168.1.1"

Wait for the script to complete. It will configure the necessary firewall rules for the following services:

- Windows Management Instrumentation (WMI)
- File and Printer Sharing
- Remote Registry
- Add the LocalAccountTokenFilterPolicy

<strong>Alternate Firewall Script</strong>

The script "AuthenticatedScan.ps1" allows you to preset the <strong>allowedIP</strong> variable by changing the parameter in the script. To use this script, follow these steps:
1. Copy the AuthenticatedScan.ps1 script to the target machines.
2. Open an elevated PowerShell prompt on each target machine.
3. Navigate to the directory where you copied the script.
4. Open the script in a text editor.
5. Locate the line that defines the $allowedIP variable (line 2).
6. Change the value of $allowedIP to the IP address that you want to allow for the inbound traffic.
7. Save the script.
8. Run the script with administrator privilege

The scan will configure the following:

- Windows Management Instrumentation (WMI)
- File and Printer Sharing
- Remote Registry
- Add the LocalAccountTokenFilterPolicy

<h3>Reverting Firewall Rules</h3>

To revert the firewall rules to their original state after an authenticated scan, follow these steps:
1. Open PowerShell as an administrator.
2. Navigate to the location of the cloned or downloaded repository.
3. Run the <strong>Revert-Firewall.ps1</strong> script.

Example: .\Revert-Firewall.ps1

Wait for the script to complete. It will remove the firewall rules that were created by the Configure-Firewall.ps1 script.

Please run this script after the Authenticated Nessus Scan has completed.

<h3>Troubleshooting</h3>

If you encounter any errors when running the scripts, ensure that you're running them as an administrator.
If you're still encountering issues after running the scripts, ensure that your Nessus Professional scan is configured correctly and that you're using the correct credentials to authenticate to the target computer(s).

<h3>Disclaimer</h3>

The scripts provided in this repository are intended to make it easier to configure firewall rules for Nessus Professional authenticated scans on on-premise computers. However, they are provided as-is and without warranty. It is your responsibility to ensure that the scripts are appropriate for your use case and to test them thoroughly before using them in a production environment.
