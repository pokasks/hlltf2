variable "tags" {}

variable "inst_type" {
  type        = string
  default     = "t2.micro"
  description = "Type of created EC2 instance"
}

variable "inst_name" {
  type        = string
  default     = "srv_01"
  description = "Name of created instance"
}
variable "key_name" {
  type        = string
  default     = "hlltf02"
  description = "KeyPair named \"hlltf02\" will be created with default or user-provided public ssh key"
}

variable "ami_id" {
  type        = string
  default     = "ami-0885b1f6bd170450c"
  description = "Image ID ami-0885b1f6bd170450c - for Ubuntu 20.04 LTS or ami-0be2609ba883822ec for AmazonLinux"
}
variable "elasticIP" {
  type        = bool
  default     = false
  description = "Set to \"TRUE\" for adding Elastic IP to EC2 instance"
}


