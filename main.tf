provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-06c68f701d8090592"  # Update with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "Terraformpipeline"
  }
}

