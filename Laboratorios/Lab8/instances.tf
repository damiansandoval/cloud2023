resource "aws_instance" "webapp-server01" {
  ami                    = "ami-0aa2b7722dc1b5612"
  instance_type          = "t2.large"
  key_name               = "vockey"
  vpc_security_group_ids = [aws_security_group.ssh-http-access.id]
  subnet_id              = aws_subnet.subnet1-practico-3tier.id
  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    private_key = file("/home/damian/Downloads/vockey.pem")
  }
  provisioner "remote-exec" {
    inline = ["sudo apt update",
      "sudo apt install -y software-properties-common",
      "sudo add-apt-repository -y ppa:ondrej/php",
      "sudo apt update",
      "sudo apt install -y git php5.6 php5.6-cli php5.6-common php5.6-mbstring php5.6-mysql php5.6-curl php5.6-gd php5.6-xml php5.6-zip",
    "sudo git clone https://github.com/mauricioamendola/simple-ecomme.git /tmp/"]
  }
  tags = {
    Name = "webapp-server01"
  }
  depends_on = [aws_db_instance.db-practico-3tier]
}

resource "aws_instance" "webapp-server02" {
  ami                    = "ami-0aa2b7722dc1b5612"
  instance_type          = "t2.large"
  key_name               = "vockey"
  vpc_security_group_ids = [aws_security_group.ssh-http-access.id]
  subnet_id              = aws_subnet.subnet2-practico-3tier.id
  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    private_key = file("~/Downloads/vockey.pem")
  }
  provisioner "remote-exec" {
    inline = ["sudo apt update",
      "sudo apt install -y software-properties-common",
      "sudo add-apt-repository -y ppa:ondrej/php",
      "sudo apt update",
      "sudo apt install -y git php5.6 php5.6-cli php5.6-common php5.6-mbstring php5.6-mysql php5.6-curl php5.6-gd php5.6-xml php5.6-zip",
    "sudo git clone https://github.com/mauricioamendola/simple-ecomme.git /tmp/"]
  }
  tags = {
    Name = "webapp-server02"
  }
  depends_on = [aws_db_instance.db-practico-3tier]
}

resource "aws_instance" "prueba" {
  ami                    = "ami-0aa2b7722dc1b5612"
  instance_type          = "t2.large"
  key_name               = "vockey"
  vpc_security_group_ids = [aws_security_group.ssh-http-access.id]
  subnet_id              = aws_subnet.subnet2-practico-3tier.id
  tags = {
    Name = "prueba"
  }
  depends_on = [aws_db_instance.db-practico-3tier]
}

