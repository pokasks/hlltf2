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
/*
variable "key_name" {
  type        = string
  default     = "hlltf02"
  description = "KeyPair named \"hlltf02\" will be created with default or user-provided public ssh key"
}
*/
variable "pub_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3yu+bHuOILNTi8jUEsglJAIxTdXpfFaQQYau5u5QKuLaoPEM/i55hNPNYSPimu9UCB7s4XE2Bos31IU6+6l4jHdkGJjGUzFE8TGZXAEY547ajp0JiQ8jQdjB+LUU/c74/QW7OaHyT8bHJML222lkIfgDo9Sln3HLvCp3/EWWGwqJKC6F6npJ1nj0VDgPiU8JIKwmxkLCjprKa5I2kjx4weoNzHNLor00+PT/nvyXpXv9LLvqiB4mkooVcDz7lHdqDCQxY8oziCnzQe9MJpaRUOkLp7Nbd8vh40ppwRDar759qOC9BD6PXSr99PvG217YlJWkblfdwRx1s4m1hqh19"
  description = "Public key string"
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
variable "ebs_size" {
  type        = number
  default     = 8
  description = "Addition ebs storage size in GB"
  validation {
    condition     = var.ebs_size >= 8 && var.ebs_size <= 20
    error_message = "Should be between 8 GB and 20 GB."
  }
}


