
resource "aws_lb" "internal_lb" {
  name               = var.internal_name
  internal           = var.inter
  load_balancer_type = var.lb_type
  security_groups    = [var.intern_lb_sg]
  subnets            = var.intern_lb_sub
}

resource "aws_lb_target_group" "private_tg" {
  name     = var.intern_lb_tg_name
  port     = var.intern_lb_port
  protocol = var.intern_prot
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "private_tg_attach" {
  target_group_arn = aws_lb_target_group.private_tg.arn
  target_id        = var.intern_tg_id
  port             = var.intern_lb_port
  #depends_on       = [aws_instance.private_ec2]
}

resource "aws_lb" "external_lb" {
  name               = var.external_name
  internal           = var.exter
  load_balancer_type = var.lb_type
  security_groups    = [var.extern_lb_sg]
  subnets            = var.extern_lb_sub
}

resource "aws_lb_target_group" "public_tg" {
  name     = var.extern_lb_tg_name
  port     = var.intern_lb_port
  protocol = var.intern_prot
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "public_tg_attach" {
  target_group_arn = aws_lb_target_group.public_tg.arn
  target_id        = var.extern_tg_id
  port             = var.intern_lb_port
  #depends_on       = [aws_instance.public_ec2]
}

resource "aws_lb_listener" "external_elb" {
  load_balancer_arn = aws_lb.external_lb.arn
  port              = var.intern_lb_port
  protocol          = var.intern_prot

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private_tg.arn
  }
}

resource "aws_lb_listener" "internal_elb" {
  load_balancer_arn = aws_lb.internal_lb.arn
  port              = var.intern_lb_port
  protocol          = var.intern_prot

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_tg.arn
  }
}

