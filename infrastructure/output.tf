output "prod_ip" {
  value = module.ec2.prod_public_ip
}
output "test_ip" {
  value = module.ec2.test_public_ip
}
output "jenkins_ip" {
  value = module.ec2.jenkins_public_ip
}
