resource "aws_instance" "terraform_vm" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = aws_key_pair.ssh_keypair
    security_groups = [ "ec2_security_group" ]
    provisioner "local-exec" {
        command = "echo $kalyan"
      
    }
    tags = {
      Name = "terraform_vm"
    }
  
}

resource "aws_key_pair" "ssh_keypair" {
    key_name = "ssh_keypair"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDrlTyCg0sgEsHn7FmAvT/4RSjhuJdHnTXsQpWpm7DGO6km3axIc7t3/LnidIkPcJ8ue/5yi+lPuf+j1a6sC9nSXpD3GRhxvpEp/qtvqDVCE9nudD4xefjsW4vr/xpdEw5WY+fgNUtiMv1ia+Eu+NRm6HynXRSjq29DsnHK94jSI964EabJYyYPOs2rdizgsoTa0xV6Df2Y1eaRp0M+NdoG+oCbluBl/d3IZz/1ZSmnNR+6pK2MflSp4xD6m34yv2bsiHLLH1/wshET71QOPgu5D3vhgk0lip4rRE4IYwgcK+3iUnKaQcu6J+ZqlQ8obg5xoI7ERLnN+C1fwBxnAUKNlMGHbxdNyAsGn+cO6af/G40elPgIv4WMlHsFu5cR9azIS9cbw4hShRNoQygKRi/Ksmn3o+2BU4ahtb+mMD3KlDcZ7iKDwxmZqGEuGucsP9I0udMJw3bR5WLmDjkJzg5hZ1u56cVAUMZ1WYyFYGCKzo+Rvk6WwHBcZ0BnzZ9+6kc= ubuntu@ip-172-31-2-133"
  
}

resource "aws_security_group" "ec2_security" {
    name = ec2_security_group
    ingress = {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]

    }
    egress = {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]

    }

  
}


