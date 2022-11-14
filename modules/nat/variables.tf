variable "allocation_id" {
  type        = string
  description = "The Allocation ID of the Elastic IP address for the gateway. Required for connectivity_type of public."
}

variable "subnet_id" {
  type        = string
  description = "The Subnet ID of the subnet in which to place the gateway."
}

variable "tag_name" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}

variable "tag_environment" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}
