# DMZ Practice

## Getting Started
This section should guide you to configurate dmz in your server
[Ubuntu](https://ubuntu.com/download/desktop) 


### Dependencies
  **You need a virtual machine with 3 ethernet adapters (1 Bridge adapter and 2 Internal Network) 
- [net-tools](https://packages.ubuntu.com/net-tools) is required show ethernet cards

  `sudo apt install net-tools`

- [isc-dhcp-server](https://www.isc.org/dhcp/) is required for server

  `sudo apt install isc-dhcp-server`

- [vim](https://github.com/vim/vim) is required for edit files

  `sudo apt install vim` 

### Instructions

- *netplan* [Code](https://github.com/Olivers11/practicasLinux/blob/so2/01-network-manager-all.yaml)
  ```bash
     sudo vim /etc/netplan/01-network-manager-all.yaml
     #Paste code
  ```
  
- *dhcpd.conf*  [Code](https://github.com/Olivers11/practicasLinux/blob/so2/dhcpd.conf)
  ```bash
     sudo vim /etc/dhcp/dhcpd.conf
     #Paste code
  ```
- *isc-dhcp-server* [Code](https://github.com/Olivers11/practicasLinux/blob/so2/isc-dhcp-server)
  ```bash
     sudo vim /etc/default/isc-dhcp-server
     #Paste code
  ```
---------
## Last Instructions
```zsh
#Check isc-dhcp-server
sudo systemctl enable isc-dhcp-server
sudo systemctl start isc-dhcp-server
sudo systemctl status isc-dhcp-server

#Save changes in netplan
sudo netplan try
sudo netplan apply

#Restart network manager
sudo systemctl restart NetworkManager

#check changes
ifconfig
```
