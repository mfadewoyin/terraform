variable "vpc_cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length"
  default     = "10.0.0.0/16"
}

variable "vpc_instance_tenancy" {
  type        = string
  description = "A tenancy option for instances launched into the VPC. Default is default, which makes your instances shared on the host. Using either of the other options (dedicated or host) costs at least $2/hr"
  default     = "default"
}

variable "vpc_enable_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults true"
  default     = true
}

variable "vpc_enable_dns_hostnames" {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false"
  default     = true
}

variable "vpc" {
  type        = bool
  description = "Boolean if the EIP is in a VPC or not"
  default     = true
}

variable "subnet_cidr_block" {
  type        = map(string)
  description = "The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length"
  default = {
    subnet_private = "10.0.1.0/24"
    subnet_public  = "10.0.2.0/24"
  }
}

variable "map_public_ip_on_launch" {
  type        = map(bool)
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false"
  default = {
    subnet_public  = true
    subnet_private = false
  }
}

variable "route_cidr_block" {
  type        = map(string)
  description = "The CIDR block of the route"
  default = {
    subnet_private = "0.0.0.0/0"

    subnet_public = "0.0.0.0/0"
  }
}

variable "security_group_name" {
  type    = string
  default = "ProdSG"

}

variable "elb_name" {
  type    = string
  default = "ProdELB"

}