output "flask_app_ip" {
  value = aws_instance.flask_app.public_ip
}
