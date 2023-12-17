# Create VPC
resource "aws_vpc" "Dev_Vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Development_vpc"
  }
}