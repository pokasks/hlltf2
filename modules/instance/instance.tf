resource "aws_instance" "srv" {
  ami           = var.ami_id
  instance_type = var.inst_type
  //  key_name        = var.key_name
  key_name        = aws_key_pair.this.key_name
  security_groups = [aws_security_group.this.name]
  tags            = merge(var.tags, { "Name" = var.inst_name })
}
resource "aws_key_pair" "this" {
  key_name_prefix = "hlltf2keys"
  public_key      = var.pub_key
  tags            = var.tags
}

resource "aws_eip" "this" {
  count    = (var.elasticIP ? 1 : 0)
  instance = aws_instance.srv.id
  tags     = var.tags
}

resource "aws_ebs_volume" "this" {
  availability_zone = aws_instance.srv.availability_zone
  type              = "gp2"
  size              = var.ebs_size
  tags              = merge(var.tags, { "Name" = "Temporary" })
}
resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdg"
  instance_id = aws_instance.srv.id
  volume_id   = aws_ebs_volume.this.id
}

resource "aws_security_group" "this" {
  name_prefix = "tmp-"
  description = "TF homework 2"
  tags        = var.tags
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group_rule" "http" {
  description       = "Allow web-trafic"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}
resource "aws_security_group_rule" "https" {
  description       = "Allow web-trafic"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}
resource "aws_security_group_rule" "ssh" {
  description       = "Allow web-trafic"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["134.249.136.132/32"]
  security_group_id = aws_security_group.this.id
}
resource "aws_security_group_rule" "mysql" {
  description       = "Allow web-trafic"
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["134.249.136.132/32"]
  security_group_id = aws_security_group.this.id
}

// OUTPUTS
output "instance_public_ip" {
  //value = aws_instance.srv.public_ip
  value     = var.elasticIP ? aws_eip.this[0].public_ip : aws_instance.srv.public_ip
  sensitive = false
}

output "instance_id" {
  value     = aws_instance.srv.id
  sensitive = false
}