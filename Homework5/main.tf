provider aws {
   region = var.region
}

variable region {
  default = ""
  type = string
}
variable instance_type {
  default = ""
  type = string
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  user_data = file("apache.sh")
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "Hey,Aiga"
    Team = "Kaizen"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

output ec2 {
    value = aws_instance.web.public_ip
}