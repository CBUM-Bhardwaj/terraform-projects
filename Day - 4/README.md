# 🚀 Day 4: Launch EC2 with VPC, Key Pair & Security Group using Terraform + Variables

This Terraform project sets up a basic AWS infrastructure with:

- ✅ Ubuntu EC2 instance (`t2.micro`)
- 🔐 SSH Key Pair for secure login
- 🛡️ Security Group with open ports 22 (SSH) and 80 (HTTP)
- 🌐 Default VPC
- 💾 8GB root block volume (`gp3`)
- 🧩 Reusable Variables for customization

---

## 📁 Files

- `main.tf`: Contains the full infrastructure code for EC2, VPC, Security Group, and Key Pair.
- `variables.tf`: Holds input variables like AMI ID, instance type, and root volume size.

---

## 🧠 Variables Used

```hcl
variable "ec2_instance_type" {
  default = "t2.micro"
  type    = string
}

variable "ec2_root_storage_size" {
  default = 8
  type    = number
}

variable "ec2_ami_id" {
  default = "ami-084568db4383264d4" # Ubuntu
  type    = string
}
