variable "vpc_cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length"
}

variable "vpc_instance_tenancy" {
  type        = string
  description = "A tenancy option for instances launched into the VPC. Default is default, which makes your instances shared on the host. Using either of the other options (dedicated or host) costs at least $2/hr"
}


variable "vpc_enable_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults true"
}

variable "vpc_enable_dns_hostnames" {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false"
}

variable "tag_name" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}

variable "tag_environment" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}

/*variable "number_of_public_subnets" {
  type        = number 
}*/
