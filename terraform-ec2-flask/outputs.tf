output "instance_ip" {
  value = aws_instance.flask_server.public_ip
}
