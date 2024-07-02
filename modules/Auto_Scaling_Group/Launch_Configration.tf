
// Launch Configration
resource "aws_launch_configuration" "LC" {
  image_id                    = var.ami_id
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.SG.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.test-key.key_name

}

output "LC_id" {
  value = aws_launch_configuration.LC.id
}