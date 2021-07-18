provider "aws" {
  region = "us-east-1"
   shared_credentials_file = "/Users/Gaurav/.aws/credentials"
   profile = "testing"
}
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}
