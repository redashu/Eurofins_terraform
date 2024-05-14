# Creating azure network 
resource "azurerm_virtual_network" "ashuaz-network" {
  resource_group_name = azurerm_resource_group.name.name
  location = var.region_name
  name = var.virnet_name
  address_space = var.virnet_address
  
}

# creating subnet 
resource "azurerm_subnet" "ashu-subnet1" {
  name = var.subnet1_name
  virtual_network_name = azurerm_virtual_network.ashuaz-network.name
  resource_group_name = azurerm_resource_group.name.name
  address_prefixes = var.subnet1_address
}
# creating public ip 
resource "azurerm_public_ip" "ashu-public-ip1" {
    name = var.my_publicIP
    resource_group_name = azurerm_resource_group.name.name
    location = var.region_name
    allocation_method = "Static"
  
}

# creating network interface from subnet 
resource "azurerm_network_interface" "ashu-nic1" {
  name = var.my_net_interface
  resource_group_name = azurerm_resource_group.name.name
  location = var.region_name

  ip_configuration {
    subnet_id = azurerm_subnet.ashu-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.ashu-public-ip1.id
    name = "ashu-ip1"
  }
  
}
