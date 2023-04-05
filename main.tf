resource "aws_instance" "terraform_vm2" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = "terraform"
    security_groups = [ "ec2_securitygroup" ]
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      private_key = ("~/.ssh/id_rsa")
    }
    provisioner "local-exec" {
        command = "echo KalyanKR >> Taskfile.txt"
      
    }
    tags = {
      Name = "terraform_vm2"
    }
  
}

resource "aws_security_group" "ec2_security_group" {
  name        = "ec2_securitygroup"
  description = "ec2_securitygroup"
  vpc_id      = "vpc-002410875da10970c"

  ingress {
    description      = "ssh_port"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "port_ssh22"
  }
}