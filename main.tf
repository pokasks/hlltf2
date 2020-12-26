provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

locals {
  common_tags = {
    Purpose = "EDU"
    Project = "TF_HomeWork_2"
  }
}

resource "aws_key_pair" "hlltf02" {
  key_name   = "hlltf02"
  public_key = var.KeyPair_pub
  tags       = local.common_tags
}

module "instance" {
  // все параметры можно определить из командной строки или файла параметров
  source    = "./modules/instance"
  inst_type = var.aws_inst_type
  ami_id    = var.aws_ami_id
  key_name  = aws_key_pair.hlltf02.key_name
  elasticIP = var.add_elastic_ip
  ebs_size  = var.aws_ebs_size
  tags      = local.common_tags
}

module "instance2" {
  // не зависит от параметров командной строки
  source    = "./modules/instance"
  elasticIP = true
  inst_type = "t3.micro"
  inst_name = "TmpSrv_t3"
  ebs_size  = 12                      //just fixed size example
  ami_id    = "ami-0be2609ba883822ec" //Amazon Linux
  key_name  = aws_key_pair.hlltf02.key_name
  tags      = local.common_tags
}
module "instance3" {
  source    = "./modules/instance"
  elasticIP = var.add_elastic_ip
  inst_type = "t2.micro"
  inst_name = "TmpSrv03"
  key_name  = aws_key_pair.hlltf02.key_name
  // Manually created KeyPair before applying
  //  key_name = "hlltf02_01"
  tags = local.common_tags
}
module "instance4" {
  // All defaults: provided (or user-defined) ssh key, no elasticIP, t2.micro, ubuntu 20.04, Name SRV_01
  source = "./modules/instance"
  tags   = local.common_tags
}
//OUTPUTS
output "instance_id" {
  value     = module.instance.instance_id
  sensitive = false
}
output "instance_public_ip" {
  value     = module.instance.instance_public_ip
  sensitive = false
}
output "instance_id_2" {
  value     = module.instance2.instance_id
  sensitive = false
}
output "instance_public_ip_2" {
  value     = module.instance2.instance_public_ip
  sensitive = false
}
output "instance_id_3" {
  value     = module.instance3.instance_id
  sensitive = false
}
output "instance_public_ip_3" {
  value     = module.instance3.instance_public_ip
  sensitive = false
}
output "instance_id_4" {
  value     = module.instance4.instance_id
  sensitive = false
}
output "instance_public_ip_4" {
  value     = module.instance4.instance_public_ip
  sensitive = false
}