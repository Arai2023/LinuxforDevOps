set -e

echo "=== Creating Groups ==="
sudo groupadd administrators || true
sudo groupadd auditors || true
sudo groupadd automation || true
sudo groupadd frontend || true
sudo groupadd backend || true
sudo groupadd db_admins || true

echo "=== Creating Users ==="
sudo useradd -m -s /bin/bash admin1 -g administrators || true
sudo useradd -m -s /bin/bash audit1 -g auditors || true
sudo useradd -m -s /bin/bash autobot -g automation || true
sudo useradd -m -s /bin/bash front1 -g frontend || true
sudo useradd -m -s /bin/bash back1 -g backend || true
sudo useradd -m -s /bin/bash dbadmin1 -g db_admins || true

echo "=== Setting Passwords (temporary, change later) ==="
echo "admin1:Admin123!" | sudo chpasswd
echo "audit1:Audit123!" | sudo chpasswd
echo "autobot:Auto123!" | sudo chpasswd
echo "front1:Front123!" | sudo chpasswd
echo "back1:Back123!" | sudo chpasswd
echo "dbadmin1:DB123!" | sudo chpasswd

echo "=== Setting Up Directories for Services ==="
sudo mkdir -p /var/www/html
sudo mkdir -p /srv/backend
sudo chown front1:frontend /var/www/html
sudo chmod 750 /var/www/html
sudo chown back1:backend /srv/backend
sudo chmod 750 /srv/backend

echo "=== Configuring Sudo Permissions ==="
# Administrator - full sudo
echo "admin1 ALL=(ALL) ALL" | sudo tee /etc/sudoers.d/admin1

# Automation bot - can restart services only
echo "autobot ALL=(ALL) NOPASSWD: /bin/systemctl restart nginx, /bin/systemctl restart backend" | sudo tee /etc/sudoers.d/autobot

# Auditor - no sudo, only read access to logs
sudo setfacl -m g:auditors:r /var/log/syslog

echo "=== Configuring SSH Access for autobot ==="
sudo -u autobot ssh-keygen -t rsa -b 4096 -f /home/autobot/.ssh/id_rsa -N "" -C "autobot@project"
# (Public key should be copied to remote servers manually or via ssh-copy-id)

echo "=== Setup Complete! ==="
