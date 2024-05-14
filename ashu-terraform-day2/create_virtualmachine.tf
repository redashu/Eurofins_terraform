# creating azure virtual machine of linux type 
resource "azurerm_linux_virtual_machine" "ashu-vm1" {
  name = var.vm_name
  resource_group_name = azurerm_resource_group.name.name
  location = var.region_name
  admin_username = var.vm_username
#   admin_password = "Eurofins@12345"
#   disable_password_authentication = false 
  network_interface_ids = [ azurerm_network_interface.ashu-nic1.id ]
  size = var.vm_size
# for authentication to linux vm we gonna use public key
  admin_ssh_key {
    username = var.vm_username
    public_key = file("C:\\Users\\Administrator\\.ssh\\id_rsa.pub")
  } 
  # from here i copied from terraform docs
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  # till this 
}