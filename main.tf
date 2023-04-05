resource "aws_instance" "terraform_vm" {
    ami = var.ami_id
    instance_type = t2.micro
    tags = {
      Name = "terraform_vm"
    }
  
}