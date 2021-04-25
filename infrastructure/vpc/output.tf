output "vpc_id" {
  value = aws_vpc.prod_vpc.id
}
output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway
}
output "public_route_table_id" {
  value = aws_route_table.public_route_table.id
}
output "private_route_table_id" {
  value = aws_route_table.private_route_table.id
}
output "web_traffic_sg_id" {
  value = aws_security_group.web_traffic.id
}
output "sql_sg_id" {
  value = aws_security_group.mysql.id
}
