provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("C:/Users/AKSHAY/.ssh/id_rsa.pub")
}

resource "aws_security_group" "flask_sg" {
  name        = "flask-sg"
  description = "Allow HTTP and SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "flask_app" {
  ami                    = "ami-07d9b9ddc6cd8dd30" # Ubuntu 22.04 in us-east-1
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.flask_sg.id]

  # Shared connection block for all provisioners
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/AKSHAY/.ssh/id_rsa")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "app.py"
    destination = "/home/ubuntu/app.py"
  }

  provisioner "file" {
    source      = "templates"
    destination = "/home/ubuntu/templates"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y python3-pip",
      "sudo pip3 install flask",
      "nohup python3 /home/ubuntu/app.py > app.log 2>&1 &"
    ]
  }

  tags = {
    Name = "FlaskAppProvisioner"
  }
}
