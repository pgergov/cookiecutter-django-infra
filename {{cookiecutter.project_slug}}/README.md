# Puppet documentation.

## What is this repository?

Our machines are provisioned and maintained **ONLY with puppet scripts**. So if you want to make any changes to the machines **DONT DO IT VIA SSH**. Make changes in this repo and run the puppet code to change the server state. 

**What this puppet code do?**

- It installs python.
- It sends the hacksoft team keys to the server.
- It installs the postgresql server and configures it.
- It installs the nginx server and configures the vhost.
- It configures a letsencrypt certificate.
- It configures everyting that django needs: directory structure, upstart jobs, env vars, etc.

## Why do we use puppet?
Using Puppet, we have dramatically reduced the time it takes us to deliver applications into production, from weeks to days and even hours.

Eliminate Configuration Drift - With Puppet, our servers remain in the state we set for them.

Visibility - Puppet gives us rich data sets not only of infrastructure configuration but also of any changes to that infrastructure. We have much more visibility into the changes occurring in our infrastructure over time and their impact to service levels

Puppet can provision a fully working server in 20 minutes. That would have taken close to a full day of work without puppet!

## How to run the puppet code?
First of all you need to have latest Ruby installed. You can use rbenv to manage ruby versions.
https://www.ruby-lang.org/en/documentation/installation/#rbenv

Then you need to install bundler. http://bundler.io/

```
$ gem install bundler
```

Then you need to install all gems that are needed to run project.

```
$ bundler install
```

Then you have to install all puppet modules. ``librarian-puppet`` is a puppet package manager.

```
$ librarian-puppet install
```
This command will install all the puppet dependencies that are mentioned in `Puppetfile`

### And now you are ready to run the puppet code

You can run the puppet code in a vagrant virtual box just to test it. **Always test your code in a virtual box before running it in production!**

```
vagrant up
vagrant provision
```

**Lets run the puppet code in production**

```
bundle exec cap $MACHINE_TYPE deploy
```
The current machine types are:

- {{cookiecutter.project_slug}}_production
- {{cookiecutter.project_slug}}_staging

This will copy the Puppets over the wire to the machine and run the manifest file.

## Common things that you can change here.

### Change the machine IP address or add a new machine

We use Capistrano to take the puppet code to the server and run it. All Capistrano tasks are located the Capistrano file. If you want to add new machine just add a new task. !!LINK

### Nginx configuration

Maybe you want to change the nginx config? It is here. !!!link

### SSH Keys

Maybe you want to give someone access to the server? Look at this file !!!link

### Django related changes

#### Change some env vars

All the env vars are located in this file !!Link

#### Change upstart configuration

Maybe you have a powerfull server and want to change the number of gunicorn processes.

Just look at the upstart job that keeps the django running.  !!!Link 

#### See sensible information
All sensible informatin like passwords is located here !!!Link
