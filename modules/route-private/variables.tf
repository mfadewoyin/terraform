variable "route_table_id" {
  type        = string
  description = "The Route Table ID"
}

variable "destination_cidr_block" {
  type = string
  description = "The CIDR block of the destination"
}

variable "nat_gateway_id" {
  type = string
  description = "Identifier of a VPC internet gateway or a virtual private gateway"
}

