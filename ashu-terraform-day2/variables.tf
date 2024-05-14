variable "ashu_res_group" {
    type = string
    default = "ashu-resgroup-day2"
    description = "name of resource group" # optional field 
  
}
# region name
variable "region_name" {
    type = string
    default = "Central US"
  
}
# name of virtual network 
variable "virnet_name" {
    type = string
    default = "ashu_virtual_network"  
}
# address space of virtual network 
variable "virnet_address" {
    type = list(string)
    default = [ "10.0.0.0/16" ]
  
}

# subnet name 
variable "subnet1_name" { 
    type = string
    default = "ashu_subnet1"
  
}
# subnet adress 
variable "subnet1_address" {
    type = list(string)
    default = [ "10.0.1.0/24" ]
  
}

# Creating name of public IP 
variable "my_publicIP" {
    type = string
    default = "ashu_public_ip"
  
}
# creating network interface name 
variable "my_net_interface" {
    type = string
    default = "ashu_network_interface"
  
}

# creating variables for VM 
## vm name variable 
variable "vm_name" {
    type = string
    default = "ashuvm"
  
}
## vm size 
variable "vm_size" {
    type = string
    default = "Standard_B1s"
  
}
## vm username 
variable "vm_username" {
  #  sensitive = true
    type = string
    default = "ashuadmin"
  
}