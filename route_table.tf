# Route table: attach Internet Gateway 
resource "aws_route_table" "PublicRouteTable" {
  vpc_id = aws_vpc.Dev_Vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "publicRouteTable"
  }
}

# Route table association with public subnets
  resource "aws_route_table_association" "PublicSubnetRouteTableAssociation1" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.PublicRouteTable.id

  }
