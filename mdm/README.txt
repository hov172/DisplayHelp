DisplayHelp MDM profile

DisplayHelp-BackgroundItems.mobileconfig pre-approves DisplayHelp's background items
on macOS 13 and later through a Service Management (com.apple.servicemanagement)
payload. Its single rule matches Team ID N859JA9UCJ, so it covers the login agent
and the DisplayHelp Updater helper that lets standard users install updates.

Import the file into your MDM as-is and scope it to the DisplayHelp Macs at the
device level. With the profile installed, Check for Update > Set Up Self-Service
Updates completes without an administrator, and Install appears for every account.

The profile approves only items signed by Ayala Solutions. It does not grant any
other privilege, and the updater installs nothing except signed, notarized
DisplayHelp releases.
