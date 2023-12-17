# Create Internet geateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.Dev_Vpc.id}"

  tags = {
    Name = "Dev_InternetGW"
  }
}