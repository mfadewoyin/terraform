variable "subnet_cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length"
}
variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}
variable "subnet_availability_zone" {
  type        = string
  description = "The AZ for the subnet"
}

variable "tag_name" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}

variable "tag_environment" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}
variable "map_public_ip_on_launch" {
  type        = bool
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false"
}