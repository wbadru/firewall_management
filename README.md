# firewall_management Script Usage Examples. This document provides examples for using the 'firewall_management.sh script with a GitHub container
Running the container ywith privilege to manage ' iptables'.
Mounting the current directory allows access to the script. ```bash # Option
1: Priviledge (Less Secure) docker run -it -m -privileged -v "$(pwd)":/mnt/host ubuntu:latest bash
# Option 2: Inside the container: Setup Once inside the container, navigate to the mounted directory and install 'iptables'. ```bash cd /mnt/host # Install iptables apt-get install -y iptables
# Make the script executable chmond +x ./firewall_management.sh list ```
Run the script can be executed as follows:
- To list current firewall rules:
 ```bash
   sudo ./firewall_manager.sh list ```
### Adding Rules
```bash
# Allon HTTP traffic on port 80
  sudo ./firewall_manager.sh add tcp 80
- To configure script settings (change the log file path or default chain):
```bash
sudo ./firewall_manager.sh configure
```

