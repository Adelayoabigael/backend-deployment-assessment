output "vpc_id" {
  value = aws_vpc.main.id
}

output "alb_dns_name" {
  value = aws_lb.external_alb.dns_name
}

output "bastion_public_ip" {
  value = aws_eip.bastion_eip.public_ip
}

output "backend_server_private_ip" {
  value = aws_instance.backend.private_ip
}