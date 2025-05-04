### Firewall Management Automation Script
# This script automates the management of firewall rules using iptables.
# It provides options to add, delete, and list rules, as well as save and restore configurations.

```bash
#!/bin/bash
# Firewall Management Automation Script
# This script automates the management of firewall rules using iptables.

# Default configuration options
LOG_FILE="/var/log/firewall_manager.log"
DEFAULT_INPUT="INPUT" # Default iptables chain

# Function to log actions and errors
log() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE" 
}

# Function to check if the last command execution was successful
check_success() {
    if [ $? -ne 0 ]; then
    echo "Error: Command failed to execute. Check permissions or input."
    exit 1
    fi
}
    
# Function to list current firewall rules
list_rules() {
    echo "Current firewall rules:"
    iptables -L -n
    check_success
}
# Function to add a new firewall rule
add_rule() [$# -ne 2] then
    echo "Usage: $0 add <protocol> <port>"
    echo "Default to chain: $DEFAULT_INPUT"
    fi
    local protocol="$1"
    local port="$2"

    ipables -A $DEFAULT_INPUT -p "$protocol" --dport "$port" -j ACCEPT
    check_success
    log "Added rule: $protocol on port $port"
    echo "Rule added: $protocol on port $port"
}
    # Function to delete a firewall rule
delete_rule() {
    if [ $# -ne 2 ]; then
        echo "Usage: $0 delete <protocol> <port>"
        echo "Default to chain: $DEFAULT_INPUT"
    fi
    local protocol="$1"
    local port="$2"
    iptables -D $DEFAULT_INPUT -p "$protocol" --dport "$port" -j ACCEPT
    check_success
    log "Deleted rule: $protocol on port $port"
    echo "Rule deleted: $protocol on port $port"
}
# Function to configure script settings
configure_settings() {
    echo "Configuring script settings..."
    read -p "Enter log file path (default: $LOG_FILE): " input_log_file
    read -p "Enter default input chain (default: $DEFAULT_INPUT): " input_chain
    if [ -n "$input_log_file" ]; then
        LOG_FILE="$input_log_file"
    fi
    if [ -n "$input_chain" ]; then
        DEFAULT_INPUT="$input_chain"
    fi
    echo "Settings configured: Log file - $LOG_FILE, Default input chain - $DEFAULT_INPUT"
    log "Settings configured: Log file - $LOG_FILE, Default input chain - $DEFAULT_INPUT"
}
# Main script logic
if [ $# -lt 1 ]; then
    echo "Usage: $0 <command> {list|add|delete|configure}" [args]"
    exit 1
fi
case "$1" in
    list)
        list_rules
        ;;
    add)
        shift
        add_rule "$@"
        ;;
    delete)
        shift
        delete_rule "$@"
        ;;
    configure)
        configure_script_settings   
        ;;
    *)
    echo "Invalid command. Usage: $0 <command> {list|add|delete|configure}"
    exit 1
    ;;
esac    
```
# End of script
# Usage:
# ./firewall_manager.sh list
# ./firewall_manager.sh add tcp 80
# ./firewall_manager.sh delete tcp 80
# ./firewall_manager.sh configure
# This script requires root privileges to modify iptables rules.
# Ensure to run it with sudo or as root.
# Note: This script is a basic example and may require additional error handling and validation for production use.
# Ensure to test the script in a safe environment before deploying it in production.
# The script is designed to be modular and can be extended with additional features as needed.
# The script uses iptables for firewall management, which is a common tool in Linux systems.
# The script logs actions to a specified log file for auditing and troubleshooting purposes.
# The script provides a simple command-line interface for users to interact with the firewall rules.
# The script is designed to be user-friendly and provides clear usage instructions.
# The script can be easily modified to include additional features or options as needed.
# The script is intended for educational purposes and should be used with caution in production environments.
# The script is provided "as is" without any warranties or guarantees.
# The script is licensed under the MIT License, allowing for modification and redistribution.
# The script is a work in progress and may be updated with additional features in the future.
# The script is designed to be compatible with most Linux distributions that support iptables.
# The script is intended for users with basic knowledge of Linux command-line tools and firewall management.
# The script is a simple and effective way to manage firewall rules on Linux systems.
# The script is designed to be easy to understand and modify for users with programming experience.
# The script is a useful tool for system administrators and security professionals.
# The script is a practical example of using bash scripting for system administration tasks.    


    
    
  
   sudo ./firewall_manager.sh list
   ```bash
   sudo ./firewall_manager.sh add tcp 80
   sudo ./firewall_manager.sh delete tcp 80
   sudo ./firewall_manager.sh configure
   ```
# End of script
# Usage:
# ./firewall_manager.sh list
# ./firewall_manager.sh add tcp 80
# ./firewall_manager.sh delete tcp 80
# ./firewall_manager.sh configure
# This script requires root privileges to modify iptables rules.
# Ensure to run it with sudo or as root.
# Note: This script is a basic example and may require additional error handling and validation for production use.
# Ensure to test the script in a safe environment before deploying it in production.
# The script is designed to be modular and can be extended with additional features as needed.
# The script uses iptables for firewall management, which is a common tool in Linux systems.
# The script logs actions to a specified log file for auditing and troubleshooting purposes.        
# The script provides a simple command-line interface for users to interact with the firewall rules.
# The script is designed to be user-friendly and provides clear usage instructions.
# The script can be easily modified to include additional features or options as needed.
# The script is intended for educational purposes and should be used with caution in production environments.           
# The script is provided "as is" without any warranties or guarantees.
# The script is licensed under the MIT License, allowing for modification and redistribution.