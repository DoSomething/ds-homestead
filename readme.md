# Laravel Homestead for DoSomething.org

The official Laravel local development environment, tweaked for DoSomething.org developers.

**Homestead** requires the use of **Virtual Box** and **Vagrant**. The current version of Homestead has been built and tested using version 1.6 of Vagrant, but still works great on **version 1.5.4**, which is the required version used for the DoSomething.org Drupal site.

If you haven't already, download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/download-archive/v1.5.4.html).

Homestead includes:

- Ubuntu 14.04
- PHP 5.5
- Nginx
- MySQL
- Postgres
- Node (With Bower, Grunt, and Gulp)
- Redis
- Memcached
- Beanstalkd
- Laravel Envoy
- Fabric + HipChat Extension

Your *one* installation of Homestead can be used to host all your Laravel (or other PHP) projects. Just add all your projects in the *sites* section of the **Homestead.yaml** file (explained below).


## Setup

It is recommended that you set up Homestead to sit at the same level as your Laravel project directories, but will need to use a different command to `ssh` into the VM.

Sample directory structure:

- laravel
  - Homestead
  - project_1
  - project_2


### Configure Homestead.yaml file

Clone this repository to your directory of choice and copy the **Homestead.default.yaml** file and rename it to **Homestead.yaml**.

Edit your **Homestead.yaml** file to configure the *folders* and *sites* to map your projects to the virtual machine.

Within the *yaml* file, edit the `USER_NAME_HERE` strings to your machine's user name. Run `whoami` in terminal if you're having an identity crisis, to let terminal tell you who you are.

Next, edit the `LARAVEL_PROJECT_NAME_HERE` strings to the desired name for your project, and add any other projects to the *sites* section.


### Configure local hosts file

You will also need to add the custom URLs you declared in the *sites* section to the `hosts` file on your local machine as well, which file can be found at `/etc/hosts`. Edit the file and add your project:

    127.0.0.1  project_name.dev

Make sure to restart your local apache server to pick up the new domains, using:

    $ sudo apachectl restart


### Launch The Vagrant Box

Now we can start the virtual machine by running the **up** command:

    $ vagrant up

If you have added the domain to your `hosts` file, you can access the site via your web browser on port *8000*:
  
    http://project_name.dev:8000


***

Official Laravel documentation [is located here](http://laravel.com/docs/homestead?version=4.2).
