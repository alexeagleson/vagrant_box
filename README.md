# Vagrant Apache 2 Web Server on Ubuntu 14 LTS

## Prerequisites

You must have the following installed:

* Bash terminal
* Vagrant (https://www.vagrantup.com/downloads.html)
* Oracle VirtualBox (https://www.virtualbox.org/wiki/Downloads)

## Software included in this Vagrant box

This custom box is built on the most popular Vagrant box for Ubunty 14 Trusty found here:

https://app.vagrantup.com/boxes/search

Customized to include the following additions:

* Apache2
* NodeJS v8
* PHP 7.2
* Phpmyadmin
* Composer
* Yarn
* Git
* SSL Cert (Optional)

## Installation

### Step 1 - Create the virtual Ubuntu environment

Make sure Vagrant is installed and available as a command on your terminal.  Create a new directory and clone this repo into it.

To create the environment, from the same directory as the Vagrantfile, run:

```
vagrant up
```

### Step 2 - Login into Ubuntu via SSH

Once the vagrant box has been installed you can access it by running:

```
vagrant ssh
```

### Step 3 - Install the bundled software

You should now have a terminal inside the Ubuntu environment.  To access the folder in your virtual environment that is linked to the one on your machine where you clonsed the repo navigate to:

```
cd /vagrant
```

You should be able to run an 'ls' command and see your Vagrantfile and scripts.

Now run the setup script type:

```
./setup.sh
```

You will be installing MySQL and phpmyadmin with these.  You will be prompted for a lot of SQL passwords.  If you're just running this to test and not concerned with security you can just enter 'root' for everything you are prompted for.

At one point during the installing it will reboot Apache and fail -- don't cancel just wait, after that you will be prompted to configure password in phpmyadmin, then when it reboots after that it will work fine.

### Step 4 - Test it out

You're done!

Now on your host machine, open a browser and navigate to:

```
http://localhost:8081
```

Port 8081 is configured to be forwarded to port 80 on your virtual machine.  This should display the dummy index.html in your project directory!

### Step 5 (Optional) - Setup SSL for HTTPS

From your vagrant directory run:

```
./setup_ssl.sh
```

You can just hit enter for each prompt.  Now you should also be able to access your index.html at:

```
https://localhost:8082
```

Port 8082 is forwarded to your virtual machine 443.  

You may get a warning about being insecure since this is just a self-generated SSL certificate.  Click "advanced" and "proceed anyway" and the warning shouldn't appear again after that.  Obviously this isn't recommended for a live production site, but it works fine for testing.

## How to exit / remove your environment

To exit back to your terminal on your host machine simply type

```
exit
```

To shut down the virtual environment, but not remove it entirely, type:

```
vagrant halt
```

You can type 'vagrant up' again to start it up again anytime.

To completely remove this virtual instance type, from the directory you created it type:

```
vagrant destroy
```

Note this will not remove the base Ubuntu 14 box from your machine.  This means that next time you create a new project with this box and use 'vagrant up' it will not need to downlaod Ubuntu again.  If you are done and wish to free up the space, you can delete the box itself, which on Windows is found in:

```
~YOUR_USERNAME/vagrant.d/boxes
```

