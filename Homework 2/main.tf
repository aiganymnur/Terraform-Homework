provider aws {
    region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "example" {
  bucket = "kaizen-aiganym"
}

resource "aws_s3_bucket" "manual" {
  bucket = "aiga123"
}
 # terraform import aws_s3_bucket.manual aiga123
resource "aws_s3_bucket" "manually" {
  bucket = "nurga123"
}
# terraform import aws_s3_bucket.manually nurga123