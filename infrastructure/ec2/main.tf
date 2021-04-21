resource "aws_instance" "prod" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = var.av_zone
  key_name          = var.key_name

  network_interface {
    device_index         = 0
    network_interface_id = var.net_id_prod
  }

  tags = {
    Name = "Prod"
  }

}

resource "aws_instance" "test" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = var.av_zone
  key_name          = var.key_name

  network_interface {
    device_index         = 0
    network_interface_id = var.net_id_test
  }

  tags = {
    Name = "Test"
  }

}

resource "aws_instance" "jenkins" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = var.av_zone
  key_name          = var.key_name

  network_interface {
    device_index         = 0
    network_interface_id = var.net_id_jenkins
  }

  tags = {
    Name = "Jenkins"
  }

}

resource "aws_db_instance" "sqldatabase" {
  identifier             = "sqldatabase"
  name                   = "sqldatabase"
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = var.database_password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  publicly_accessible    = false
  db_subnet_group_name   = var.subnet_group_name
  vpc_security_group_ids = [var.sql_sg_id]
}
