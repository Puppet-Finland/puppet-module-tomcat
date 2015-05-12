# tomcat

A Puppet module for managing tomcat.

This module was forked from the now unmaintened
[Tomcat module](https://github.com/puppetlabs-seteam/puppet-module-tomcat)
from Puppet Labs SE team.

# Module usage

* [Class: tomcat](manifests/init.pp)
* [Class: tomcat::app::admin](manifests/manifests/app/admin.pp)
* [Class: tomcat::app::docs](manifests/manifests/app/doc.pp)
* [Define: tomcat::war](manifests/war.pp)

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has been tested on

* Ubuntu 14.04

Any *NIX-style operating system should work out of the box or with small 
modifications.

For details see [params.pp](manifests/params.pp).
