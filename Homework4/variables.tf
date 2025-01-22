variable region {
    default = "us-east-2"
}

variable instance_name {
  default = "kaizen-aiga"
  type = string
}

variable key_name {
  default = "deployer-key"
}

variable port {
    type = list
    default = [22, 80, 443]
}

variable instance_type {
  default = "t2.micro"
  type = string
}


variable ami_id {
  default = "ami-08970251d20e940b0"
  type = string
}