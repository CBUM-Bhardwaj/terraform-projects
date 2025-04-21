# 🚀 Day 3: Launch EC2 with VPC, Key Pair & Security Group using Terraform

This Terraform project sets up a basic AWS infrastructure with:

- ✅ Ubuntu EC2 instance (`t2.micro`)
- 🔐 SSH Key Pair for secure login
- 🛡️ Security Group with open ports 22 (SSH) and 80 (HTTP)
- 🌐 Default VPC
- 💾 8GB root block volume (`gp3`)

---

## 📁 File

- `main.tf`: Contains the full infrastructure code for EC2, VPC, Security Group, and Key Pair.

---

## 🛠️ How to Run

```bash
terraform init
terraform plan
terraform apply
