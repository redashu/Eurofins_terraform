# creating azure virtual machine of linux type 
resource "azurerm_linux_virtual_machine" "ashu-vm1" {
  name = "${var.vm_name}-vm${count.index}"
  resource_group_name = azurerm_resource_group.name.name
  location = var.region_name
  admin_username = var.vm_username
  count = 4
#   admin_password = "Eurofins@12345"
#   disable_password_authentication = false 
  network_interface_ids = [ azurerm_network_interface.ashu-nic1[count.index].id ]
  size = var.vm_size
# for authentication to linux vm we gonna use public key
  admin_ssh_key {
    username = var.vm_username
    public_key = file("~/.ssh/id_rsa.pub")
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
  # provisioner "remote-exec" {
  #   inline = [ 
  #     "sudo apt update",
  #     "sudo apt install git -y"
  #    ]
  #    connection {
  #      type = "ssh"
  #      user = var.vm_username
  #      host = azurerm_public_ip.ashu-public-ip1[count.index].ip
  #    }
 
}