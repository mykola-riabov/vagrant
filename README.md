GitHub Repository Description: Automated VM Deployment with Vagrant

Welcome to the Vagrant project repository that simplifies the deployment of virtual machines for a networked environment. This repository utilizes Vagrant to automate the creation and provisioning of two VMs, "ncs1web" and "ncs2db," on the Ubuntu 20.04 image.

Key Features:

Effortless VM Management: Leverage Vagrant to seamlessly create, configure, and provision virtual machines for a network setup.

Dual VM Deployment: The repository deploys two VMs, "ncs1web" for web services and "ncs2db" for database services, each with distinct configurations.

Network Configuration: VMs are assigned private IP addresses (192.168.60.20 and 192.168.60.21) for communication within the network.

Port Forwarding: Access web services hosted on "ncs1web" through port forwarding from host port 22080 to guest port 80.

Resource Customization: Customize memory, CPU, and other settings for each VM using the VirtualBox provider.

Provisioning Scripts: Automate provisioning by copying and executing scripts within the VMs, configuring them for their respective roles.

Getting Started:

Clone the repository to your local machine.
Review and modify the Vagrant configuration as needed.
Run vagrant up to create and provision the VMs.
Access web services on "ncs1web" through http://localhost:22080.
Explore the power of Vagrant in automating the deployment of virtual machines for networked environments. Simplify your development and testing processes using this repository as a foundation for your projects.
