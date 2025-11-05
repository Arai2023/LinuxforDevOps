#!/bin/bash
echo "Testing Python and Flask..."
python3 -c "import flask; print('Flask OK')"

echo "Testing Docker..."
sudo systemctl start docker
sudo docker run hello-world

echo "Testing Git..."
git --version

echo "Testing Firewall..."
sudo ufw status

echo "All packages successfully tested!"
