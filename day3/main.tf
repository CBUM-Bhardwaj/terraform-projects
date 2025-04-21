# ----------------------- Key Pair -----------------------
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("ec2-key.pub")
}

# ------------------------ VPC ---------------------------
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default-vpc"
  }
}

# -------------------- Security Group --------------------
resource "aws_security_group" "my_security_group" {
  name        = "Security Group made by Terraform"
  description = "This is added by Terraform"
  vpc_id      = aws_default_vpc.default.id

  # Inbound Rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH - Open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP - Open"
  }

  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All traffic - Open"
  }

  tags = {
    Name = "Auto - Security Group"
  }
}

# --------------------- EC2 Instance ----------------------
resource "aws_instance" "newvm" {
  ami                    = "ami-084568db4383264d4" # Ubuntu AMI
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer.key_name
  security_groups        = [aws_security_group.my_security_group.name]

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "Made by Terraform"
  }
}
