provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "akshay_instance" {
  ami           = var.ami_id # Example AMI ID, replace with a valid one
  instance_type = var.instance_type

  tags = {
    Name = "AkshayInstance"
  }
  
}