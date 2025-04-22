#--------------- Key Pair ---------------

resource "aws_key_pair" deployer {
    key_name = "deployer-key"
    public_key = file("ec2-key.pub")
}

#------------------ VPC ------------------

resource "aws_default_vpc" "default" {
    tags = {
        Name = "Default-vpc" 
    }
}

#------------- Security Group -------------

resource "aws_security_group" "my_security_group" {
    name = "Security Group made by Terraform"
    description = "This is added by Terrafrom "
    vpc_id = aws_default_vpc.default.id #Interpolation

    # Inbound
    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        description = "SSH - Open"
    }

    ingress {
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        description = "HTTP - Open"
    }

    # Outbound
    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
        description = "All traffic - Open"
    }

    tags = {
        Name = "Auto - Security Group"
    }
}

#-------------- EC2 Instance --------------

resource "aws_instance" newvm {
    key_name = aws_key_pair.deployer.key_name
    ami = var.ec2_ami_id #Ubuntu
    instance_type = var.ec2_instance_type
    security_groups = [aws_security_group.my_security_group.name]

    root_block_device {
        volume_size = var.ec2_root_storage_size
        volume_type = "gp3"
    }
    
    tags ={
        Name = "Made by Terraform"
    }
}
