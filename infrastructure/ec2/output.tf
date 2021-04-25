output "prod_private_ip" {
  value = aws_instance.prod.private_ip
}
output "test_private_ip" {
  value = aws_instance.test.private_ip
}
output "jenkins_private_ip" {
  value = aws_instance.jenkins.private_ip
}
output "prod_public_ip" {
  value = aws_instance.prod.public_ip
}
output "test_public_ip" {
  value = aws_instance.test.public_ip
}
output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}
output "prod_id" {
  value = aws_instance.prod.id
}
output "test_id" {
  value = aws_instance.test.id
}
output "jenkins_id" {
  value = aws_instance.jenkins.id
}
