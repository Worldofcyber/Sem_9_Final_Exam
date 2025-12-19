resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  
  # Attach the Security Group
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # 30GB Disk Requirement
  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  # Nginx setup script
  user_data = file("install_nginx.sh")

  tags = {
    Name = "naresh-Exam-Server"
  }
}