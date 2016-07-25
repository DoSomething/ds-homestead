# DS.org Homestead

__The official Laravel local development environment, tweaked for DoSomething.org.__ Your _one_ installation of Homestead can be used to host all your Laravel (or other PHP) projects.

### Getting Started

Clone this repository somewhere on your machine, for example `~/Sites/homestead`.

Copy the included example configuration and [customize for your machine](https://laravel.com/docs/5.2/homestead#configuring-homestead):

```
$ cp Homestead.default.yaml Homestead.yaml
```

Make sure `folders` maps your local code directory (e.g. `~/Sites`) to the same path on the virtual machine, and then add an entry to `sites` mapping a domain to each Laravel application's `public` directory. Remember to add each domain (e.g. `127.0.0.1 laravel.dev`) to your machine's `/etc/hosts` file!

Finally, add this function to your `.bashrc` to easily access the Homestead Vagrant machine from anywhere (be sure to change the `HOMESTEAD_DIRECTORY` to match where you cloned this repository!) 

```sh
function hs() {
  DIRECTORY=$(pwd)
  HOMESTEAD_DIRECTORY=~/Sites/homestead
  HOME_RELATIVE_DIRECTORY=${DIRECTORY/$HOME/\~}
  DEFAULT="ssh --command \"cd $HOME_RELATIVE_DIRECTORY; bash\""
  (cd $HOMESTEAD_DIRECTORY; eval "vagrant ${*:-$DEFAULT}")
}
```

If you change the `sites` property after provisioning the Homestead box, you should run `hs reload --provision` to update the Nginx configuration on the virtual machine.

### Usage

You can start the virtual machine by running `hs up`. Any Laravel domains you configured (by adding them to the `sites` config and `/etc/hosts` file as described above) will be accessible at [`http://project_name.dev:8000`](#).

You can SSH from a project directory on your local machine to the corresponding directory on your virtual machine by simply running `hs`. Finally, you can shut down your Homestead box by running `hs halt`.

## Troubleshooting

You may get "key checking" errors if you are switching between multiple Vagrant boxes on the same machine. You can disable key checking for your local machine by adding the following lines to your `~/.ssh/config` file.

```
Host 127.0.0.1
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
```
