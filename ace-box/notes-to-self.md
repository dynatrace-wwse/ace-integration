# Installation steps & issues


## Test 1
- sudo bash $REPO_PATH/ace/init.sh

Initializing machine ID from D-Bus machine ID.
/usr/lib/tmpfiles.d/systemd-network.conf:10: Failed to resolve user 'systemd-network': No such process
/usr/lib/tmpfiles.d/systemd-network.conf:11: Failed to resolve user 'systemd-network': No such process
/usr/lib/tmpfiles.d/systemd-network.conf:12: Failed to resolve user 'systemd-network': No such process
/usr/lib/tmpfiles.d/systemd-network.conf:13: Failed to resolve user 'systemd-network': No such process
/usr/lib/tmpfiles.d/systemd.conf:22: Failed to resolve group 'systemd-journal': No such process
/usr/lib/tmpfiles.d/systemd.conf:23: Failed to resolve group 'systemd-journal': No such process
/usr/lib/tmpfiles.d/systemd.conf:28: Failed to resolve group 'systemd-journal': No such process
/usr/lib/tmpfiles.d/systemd.conf:29: Failed to resolve group 'systemd-journal': No such process
/usr/lib/tmpfiles.d/systemd.conf:30: Failed to resolve group 'systemd-journal': No such process



INIT - Installing Ansible requirements...
[ERROR]: The requirements file '/home/root/.ace/ansible_requirements.yml' does not exist.

Could not find /home/root/ansible_collections/ace_box/ace_box.

INIT - Setting up ACE-CLI...
ERROR: Could not open requirements file: [Errno 2] No such file or directory: '/home/root/.ace/requirements.txt'

## Test 2
see functoin 

installAceCLi


# Configuring / running ace

# Create the ace configuration
sudo ACE_BOX_USER=vscode \
  ACE_INGRESS_DOMAIN=localhost.nip.io \
  ACE_INGRESS_PROTOCOL=http \
  ace prepare --force


# With Dynatrace configuration
sudo ACE_BOX_USER=vscode \
  ACE_ANSIBLE_WORKDIR=/workspaces/ace-integration/ace-box/user-skel/ansible/ \
  ACE_INGRESS_DOMAIN=localhost.nip.io \
  ACE_INGRESS_PROTOCOL=http \
  ACE_DT_TENANT=https://your-tenant.live.dynatrace.com \
  ACE_DT_API_TOKEN=your-api-token \
  ace prepare --force

--------


Quick Installation Script


```bash
# 1. Navigate to the user-skel directory
cd /workspaces/ace-box/user-skel

# 2. Install Python prerequisites
sudo apt-get update
sudo apt-get install -y python3 python3-pip python3-venv ansible

# 3. Install Python dependencies for ace-cli
python3 -m pip install --user -r .ace/requirements.txt

# 4. Install Ansible requirements
ansible-galaxy install -r .ace/ansible_requirements.yml

# 5. Install ACE-Box Ansible collection
ansible-galaxy collection install ansible_collections/ace_box/ace_box

# 6. Copy ace CLI to your local bin (or use sudo for system-wide)
mkdir -p ~/.local/bin
cp .ace/ace ~/.local/bin/ace
chmod +x ~/.local/bin/ace

# 7. Ensure ~/.local/bin is in your PATH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# 8. Verify installation
ace --version
```

Key Differences from VM Installation
In a Codespace:

No sudo needed for pip installs (use --user flag instead)
No cloud-init wait required
Install to ~/.local/bin instead of bin (or use sudo if you have permissions)
Ansible and Python should already be available, but verify versions
You won't have the full environment variables that terraform sets (like ACE_INGRESS_DOMAIN), so some ace commands may require manual configuration