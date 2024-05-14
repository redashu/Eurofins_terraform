output "my_public_ip_print" {
  value = azurerm_public_ip.ashu-public-ip1.ip_address
}

output "vm_id_info" {
    value = azurerm_linux_virtual_machine.ashu-vm1.id
  
}