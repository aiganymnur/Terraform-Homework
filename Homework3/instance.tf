provider aws {
    region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


data "aws_ami" "Amazon-linux2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical
}

resource "aws_instance" "web-1" {
    depends_on = [aws_key_pair.deployer]
  ami           = data.aws_ami.Amazon-linux2.id
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-1"
  }
}

output ec2-1 {
    value = aws_instance.web-1.public_ip
}

resource "aws_instance" "web-2" {
    depends_on = [aws_key_pair.deployer]
  ami           = data.aws_ami.Amazon-linux2.id
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-2"
  }
}

output ec2-2 {
    value = aws_instance.web-2.public_ip
}

resource "aws_instance" "web-3" {
    depends_on = [aws_key_pair.deployer]
  ami           = data.aws_ami.Amazon-linux2.id
  instance_type = "t2.micro"
  availability_zone = "us-east-1c"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-3"
  }
}
output ec2-3 {
    value = aws_instance.web-3.public_ip
}