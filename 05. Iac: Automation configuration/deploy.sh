#!/bin/bash
set -e

cd terraform

echo "Running Terraform..."
terraform init
terraform apply -auto-approve

echo "Extracting IPs..."
PRIMARY_IP=$(terraform output -raw primary_ip)
REPLICA_IP=$(terraform output -raw replica_ip)

cd ../ansible

echo "Generating inventory.ini..."
cat <<EOF > inventory.ini
[primary]
$PRIMARY_IP ansible_user=ubuntu

[replica]
$REPLICA_IP ansible_user=ubuntu

[all:vars]
ansible_ssh_private_key_file=~/.ssh/id_rsa
ansible_python_interpreter=/usr/bin/python3
EOF

echo "Running Ansible..."
ansible-playbook -i inventory.ini playbook.yml
