output "eip_public_ip" {
  value = aws_eip.nat_gateway_eip.public_ip
}
output "network_interface_prod_id" {
  value = aws_network_interface.network_interface_prod.id
}
output "network_interface_test_id" {
  value = aws_network_interface.network_interface_test.id
}
output "network_interface_jenkins_id" {
  value = aws_network_interface.network_interface_jenkins.id
}
output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}
output "subnet_group_name" {
  value = aws_db_subnet_group.private_group3.name
}
