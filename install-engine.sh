#!/bin/bash
#
###############################################################################
#    PBX-ASL-Engine v0.50
#    Copyright (C) 2022 Shane P Daley, M0VUB <support@gb7nr.co.uk>  
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software Foundation,
#   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
###############################################################################
echo "Are we up to date?"
                      apt-get update -y
clear
echo "Starting installer....."

echo Installing required packages...
                     apt-get -y install wget git docker docker-compose figlet

echo "Installing repositories....."
                     git clone https://github.com/ShaYmez/PBX-ASL-Engine.git
		     cd /opt/PBX-ASL-Engine

echo "Set userland-proxy to false..."
echo '{ "userland-proxy": false}' > /etc/docker/daemon.json

echo "Restart docker..."
systemctl restart docker

          echo Make config directories...
          mkdir -p /etc/asl
          mkdir -p /etc/asl/user1
          mkdir -p /etc/asl/user2
          mkdir -p /etc/asl/user3
          
echo "Install configuration ..." 
          cd /asterisk/configs
	  cp -p rpt.conf.sample /etc/asl/user1/rpt.conf
	  cp -p rpt.conf.sample /etc/asl/user2/rpt.conf
	  cp -p rpt.conf.sample /etc/asl/user3/rpt.conf
	  cp -p iax.conf.sample /etc/asl/user1/iax.conf
	  cp -p iax.conf.sample /etc/asl/user2/iax.conf
	  cp -p iax.conf.sample /etc/asl/user3/iax.conf
	  cp -p extensions.conf.sample /etc/asl/user1/extensions.conf
	  cp -p extensions.conf.sample /etc/asl/user2/extensions.conf
	  cp -p extensions.conf.sample /etc/asl/user3/extensions.conf
	  cp -p modules.conf.sample /etc/asl/user1/modules.conf
	  cp -p modules.conf.sample /etc/asl/user2/modules.conf
	  cp -p modules.conf.sample /etc/asl/user3/modules.conf

echo "Add SSH key folders....."
                     mkdir -p /etc/asl/user1/.ssh
cat << EOF > /etc/asl/user1/.ssh/authorized_keys
# Authorized keys to access individual containers with root. Add your public key to this file to gain access
EOF

                     mkdir -p /etc/asl/user2/.ssh
cat << EOF > /etc/asl/user2/.ssh/authorized_keys
# Authorized keys to access individual containers with root. Add your public key to this file to gain access
EOF

                     mkdir -p /etc/asl/user3/.ssh
cat << EOF > /etc/asl/user3/.ssh/authorized_keys
# Authorized keys to access individual containers with root. Add your public key to this file to gain access
EOF

sleep 3
echo "Done."
sleep 3

echo "Install docker-compose.yml"
                     cp docker-compose.yml /etc/asl/docker-compose.yml
echo "Done"
echo "Folder permissions?"
                     chmod -R 755 /etc/asl
echo "Start the containers!"
sleep 2
figlet "AllStarLink'"
sleep 2
                     cd /etc/asl
		     docker-compose up -d
		     


echo "ASL-PBX-Engine is installed. Use docker compose commands to control containers!. AKA ShaYmez"
exit 0
