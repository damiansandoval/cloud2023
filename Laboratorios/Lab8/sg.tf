resource "aws_security_group" "ssh-http-access" {
  name   = "ssh-http-access"
  vpc_id = aws_vpc.vpc-practico-3tier.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
# creo el security group para poder acceder a la base de datos desde los webservers
resource "aws_security_group" "mysql_sg" {
  name   = "mysql-sg"
  vpc_id = aws_vpc.vpc-practico-3tier.id

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    #cidr_blocks = [aws_subnet.subnet1-practico-3tier.cidr_block, aws_subnet.subnet2-practico-3tier.cidr_block]
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}