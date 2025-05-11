# LXC GPU Card Identifier

## Overview

This Bash script dynamically updates the GPU card identifier in an LXC configuration file (`/etc/pve/lxc/100.conf`). It scans the `/dev/dri/` directory for available GPU devices (`card0` or `card1`), selects the first valid reference, and replaces occurrences of `card0` or `card1` in the target configuration file with the identified GPU card.

## Usage

### Prerequisites
- The script requires a Proxmox environment with LXC containers.
- It must be run with sufficient permissions to modify `/etc/pve/lxc/100.conf`.

### Running the Script
1. Save the script as `update_gpu_card.sh`.
2. Grant execution permission:  
   ```sh
   chmod +x update_gpu_card.sh
   ```
## Running the Script as a Cron Job

To automatically execute the script at system reboot, follow these steps:

### 1. Edit the Crontab
Open the crontab editor for the root user:

```sh
sudo crontab -e
```

```sh
@reboot /path/to/update_gpu_card.sh
```
