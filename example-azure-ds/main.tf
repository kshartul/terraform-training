
resource "azurerm_network_interface" "example" {
  name   = "example-nic"
  resource_group_name   = var.group_name
  location              = data.azurerm_virtual_network.example.location
  ip_configuration {
    name                           = "testconfiguration1"
    subnet_id                      =  data.azurerm_subnet.example.id
    private_ip_address_allocation  = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "example"{
  name                         = "example-vm"
  location                     = data.azurerm_virtual_network.example.location
  resource_group_name          = var.group_name
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