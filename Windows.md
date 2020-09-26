# Slow network speed inside WSL2

1. Open Ubuntu (or your other distro)
1. Open Network Connections in your settings ("View network connections" in your windows search)
1. You should see
  > vEthernet (WSL)
  > Enabled
  > Hyper-V Virtual Ethernet Adapter
1. Right-click and open Properties
1. In the Properties pane, click Configure...
1. In the Configure pane, go to the "Advanced" Tab
1. Click on "Large Send Offload Version 2" and update the value to "Disabled"
  If you see two "Large Send Offload Version" options, disable both.

Additionally, it is recommended that you install any projects, packages, etc. to your Linux file system.

1. In your Ubuntu/other cli, navigate to your Linux file system with cd ~
1. Sanity-check you're in your Linux file system by using the command explorer.exe .. This should open File Explorer inside Network > wsl$ > Ubuntu (or other) > home > user
