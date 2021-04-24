resource "azurerm_resource_group" "example" {
  name = "example-resources"
  location = "East US"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "internal" {
  name = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefix = "10.0.0.0/24"
}

resource "azurerm_network_interface" "example" {
  name   = "example-nic"
  resource_group_name   = azurerm_resource_group.example.name
  location              = azurerm_resource_group.example.location
  ip_configuration {
    name                           = "testconfiguration1"
    subnet_id                      = azurerm_subnet.internal.id
    private_ip_address_allocation  = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "example"{
  name                         = "example-vm"
  location                    = azurerm_resource_group.example.location
  resource_group_name          = azurerm_resource_group.example.name
  network_interface_ids        = [azurerm_network_interface.example.id]
  vm_size                      = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
   storage_os_disk {
        name                 = "myOSDisk"
        create_option        = "FromImage"
        caching              = "ReadWrite"
        managed_disk_type    = "Standard_LRS"
    }
    delete_os_disk_on_termination =  true
    os_profile {
      computer_name  = "hostname"
      admin_username = "newadmin"
      admin_password = "P@ssw0rd123"
    }
    os_profile_linux_config{
      disable_password_authentication = false
    }
  
}