terraform {
  backend "s3" {
    bucket = "hw5-aiganym"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "lock-state"
  }
}
