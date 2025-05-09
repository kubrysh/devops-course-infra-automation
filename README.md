# DevOps Course Tasks

**Requirements**: Installed Terraform, Ansible and AWS Credentials.

## 04. Iac Infrastructure automation

**Tech**: AWS, Terraform.

Automatic deployment of 2 EC2 instances with security group for SSH and PostgreSQL and 2 SSH keys.

### Usage:

```
cd 04.\ Iac\ Infrastructure\ automation/

terraform init
terraform plan
terraform apply
```

## 05. Iac: Automation configuration

**Tech**: AWS, Terraform, Ansible.

Automatic deployment of 2 EC2 instances with PostgreSQL 17 on Ubuntu 24.04 with setup of streaming and logical replication.

### Usage:

```
cd 05.\ Iac:\ Automation\ configuration/

POSTGRES_PASSWORD="<YOUR_PASSWORD>" ./deploy.sh
```