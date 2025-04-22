output "Public_IP" {
    value = aws_instance.newvm.public_ip
}
output "Public_DNS" {
    value = aws_instance.newvm.public_dns
}
output "SSH" {
    value = "ssh -i ec2-key ubuntu@${aws_instance.newvm.public_dns}"
}
