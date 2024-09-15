# Installation Guide

Follow these steps to install and configure the application.

### 1. Install PostgreSQL

First, you need to install PostgreSQL. Use the appropriate instructions based on your operating system:

- **Windows:** Follow the steps below to install PostgreSQL on Windows.
- **Linux:** Follow the steps below to install PostgreSQL on Linux.
- **macOS:** Follow the steps below to install PostgreSQL on macOS.

### 2. Create database in postgres for AIV and Security

### 3. Configure Installation

Once that is done, open `install.bat` on Windows or `install.sh` on Linux, and update the following variables accordingly. For example:

```bash
set aiv_port=8080
set aiv_jdbc_url=jdbc:postgresql://localhost:5432/aiv?currentSchema=Default
set aiv_db_user=postgres
set aiv_db_password=postgres
set security_jdbc_url=jdbc:postgresql://localhost:5432/aiv?currentSchema=security
set security_db_user=postgres
set security_db_password=postgres
```

### 4. Now, save the file and run `install.bat` or `install.sh` according to your operating system.


### 5. Once the above step is completed, start your AIV by running `aiv.bat` or `aiv.sh` according to your operating system.