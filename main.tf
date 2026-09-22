provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket       = "aywhduewid"
    key          = "ec2/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}

resource "aws_instance" "myfirstserver" {
  count = 3
  ami           = "ami-035827357e3c7e810"
  instance_type = "t3.micro"
  tags = {
    Name = "myserver-${count.index + 1}"
  }
}
