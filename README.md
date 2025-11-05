# Student’s Individual Study #2  
**Course:** Linux for DevOps and Cloud Technologies  
**Student:** Izteleuova Arailym

---

## 📌 Topic: Users and Permissions  
### 🎯 Target  
Define a role table for the project and prepare automation of the setup.  

---

## 📑 Project Description  

This project implements **role-based access control (RBAC)** for the sample project *Hotel Finder*.  
The goal is to:  
- Define user roles and service accounts.  
- Assign permissions and sudo privileges.  
- Automate the setup of groups, users, permissions, and SSH configuration.  

All actions are automated in a Bash script and can be reproduced on any Linux server.  

---

## 📊 Role Table  

| **Role/Group**   | **Description**                     | **Permissions**                                        | **Superuser Permissions**      |
|------------------|-------------------------------------|--------------------------------------------------------|--------------------------------|
| **administrator** | System administrator               | Full access to system, manage users, install packages   | `ALL` via `sudo`               |
| **auditor**      | Responsible for logs & monitoring   | Read-only access to `/var/log/` and DB read-only        | None                           |
| **automation_bot** | CI/CD automation user              | Access configs, restart services                        | Limited sudo (systemctl)       |
| **frontend_user** | Runs frontend service (Nginx)       | Access `/var/www/html`, `/etc/nginx/`                   | None                           |
| **backend_user** | Runs backend service (Django/Flask) | Access `/srv/backend/`, `/etc/backend/`                 | None                           |
| **db_admin**     | Database administrator              | Manage DB, backups, schema changes                      | DB superuser                   |
| **postgres**     | PostgreSQL service account          | DB operations, configs in `/etc/postgresql/`            | DB superuser (Postgres only)   |
| **user**         | Regular app user (hotel bookings)   | Can store/retrieve own data                             | None                           |

---

## ⚙️ Automation Script  

The setup is fully automated in `setup_users.sh`.  

### 🔧 Features  
- Creates groups and users.  
- Sets directory ownership and permissions.  
- Configures sudo privileges.  
- Generates SSH keys for `autobot`.  


