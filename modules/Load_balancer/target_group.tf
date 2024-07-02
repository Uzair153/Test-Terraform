resource "aws_lb_target_group" "tg" {
  name        = var.TG_name
  port        = var.TG_port
  protocol    = var.TG_protocol
  target_type = "instance"
  vpc_id      = var.vpc_id
}

# resource "aws_lb_target_group_attachment" "tg_attachment" {
#   target_group_arn = aws_lb_target_group.tg.arn
#   target_id        = module.Autoscaling.LC_id
#   port             = 80
# }

output "arn" {
  value = aws_lb_target_group.tg.arn
}