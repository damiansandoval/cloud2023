# creamos la base de datos
resource "aws_db_instance" "db-practico-3tier" {  
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = "dbuser123"
  password               = "dbpass123"
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-practico-3tier.id
  vpc_security_group_ids = [aws_security_group.mysql_sg.id]
  skip_final_snapshot    = true
}

resource "aws_db_subnet_group" "db-subnet-practico-3tier" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.subnet1-practico-3tier.id, aws_subnet.subnet2-practico-3tier.id]
}

