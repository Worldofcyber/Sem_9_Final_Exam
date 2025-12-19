resource "aws_instance" "web_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Deployed via Terraform in Mumbai</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Nginx-Server-Mumbai"
  }
}

output "website_url" {
  value = "http://${aws_instance.web_server.public_ip}"
}