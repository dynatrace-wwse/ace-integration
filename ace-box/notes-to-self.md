# Installation steps & issues



installAceCli 

configureAceDT
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