# Laravel Homestead for DoSomething.org

The official Laravel local development environment, tweaked for DoSomething.org developers.

**Homestead** requires the use of **Virtual Box** and **Vagrant**. The current version of Homestead has been built and tested using version 1.6 of Vagrant, but still works great on **version 1.5.4**, which is the required version used for the DoSomething Drupal site.

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

Your *one* installation of Homestead can be used to host all your Laravel (or other PHP) projects. Just add all your projects in the *sites* section of the **Homestead.yaml** file.

**more to come**

## Setup

You will also need to add the "domains" for your Nginx sites to the `hosts` file on your machine as well:

    127.0.0.1  project_name.dev
    127.0.0.1  project_name.app

Make sure to restart your local apache server to pick up the new domains, using:

    $ sudo apachectl restart

Once you have added the domain to your `hosts` file, you can access the site via your web browser on port 8000:
  
    http://project_name.dev:8000


***

Official documentation [is located here](http://laravel.com/docs/homestead?version=4.2).
