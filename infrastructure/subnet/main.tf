resource "aws_subnet" "subnet_1" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true
  tags = {
  Name = "public subnet" }
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-1b"
  tags = {
    Name = "private subnet"
  }
}

resource "aws_subnet" "subnet_3" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1c"
  tags = {
    Name = "private subnet"
  }
}

resource "aws_db_subnet_group" "private_group" {
  name       = "private_group"
  subnet_ids = [aws_subnet.subnet_2.id, aws_subnet.subnet_3.id]

  tags = {
    Name = "Database private subnet group"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = var.public_route_table_id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = var.private_route_table_id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.subnet_3.id
  route_table_id = var.private_route_table_id
}

resource "aws_network_interface" "network_interface_prod" {
  subnet_id       = aws_subnet.subnet_1.id
  private_ips     = ["10.0.1.50"]
  security_groups = [var.web_traffic_sg_id]
}

resource "aws_network_interface" "network_interface_test" {
  subnet_id       = aws_subnet.subnet_1.id
  private_ips     = ["10.0.1.51"]
  security_groups = [var.web_traffic_sg_id]
}

resource "aws_network_interface" "network_interface_jenkins" {
  subnet_id       = aws_subnet.subnet_1.id
  private_ips     = ["10.0.1.52"]
  security_groups = [var.web_traffic_sg_id]
}

resource "aws_eip" "nat_gateway_eip" {
  vpc        = true
  depends_on = [var.internet_gateway]
}

resource "aws_nat_gateway" "nat_gateway" {
  depends_on    = [aws_eip.nat_gateway_eip]
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.subnet_1.id
  tags = {
    Name = "NAT gateway"
  }
}

resource "aws_route_table" "nat_gateway_route_table" {
  depends_on = [aws_nat_gateway.nat_gateway]
  vpc_id     = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "NAT gateway route table"
  }
}
