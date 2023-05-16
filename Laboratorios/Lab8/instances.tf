resource "aws_instance" "webapp-server01" {
  ami                    = "ami-02396cdd13e9a1257"
  instance_type          = "t2.large"
  key_name               = "vockey"
  vpc_security_group_ids = [aws_security_group.ssh-http-access.id]
  subnet_id              = aws_subnet.subnet1-practico-3tier.id
  tags = {
    Name = "webapp-server01"
  }
  depends_on = [ aws_db_instance.db-practico-3tier ]
}

resource "aws_instance" "webapp-server02" {
  ami                    = "ami-02396cdd13e9a1257"
  instance_type          = "t2.large"
  key_name               = "vockey"
  vpc_security_group_ids = [aws_security_group.ssh-http-access.id]
  subnet_id              = aws_subnet.subnet2-practico-3tier.id
  tags = {
    Name = "webapp-server02"
  }
  depends_on = [ aws_db_instance.db-practico-3tier ]
}