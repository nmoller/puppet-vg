# Vagrant puppetserver

This is a centos 7.2 with the puppetserver ready to start in it.

## Servername: puppetmaster.example.com

The puppetserver service is started and ready to restart automatically after a 
```
$ vagrant halt
```

that causes the delay when you do your

```
$ vagrant up
```


## Further dev

Everything is ready to create a cluster setting the ips of each machine if you copy and edit the config block to add some hosts.


