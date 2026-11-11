variable "subscription_id" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus2"
}

variable "node_vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "node_count" {
  type    = number
  default = 2
}
