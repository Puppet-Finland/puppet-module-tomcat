#
# == Class: tomcat::install
#
# Install Tomcat
#
class tomcat::install
(
    $ensure,
    $package_name

) inherits tomcat::params
{
    package { 'tomcat':
        ensure => $ensure,
        name   => $package_name,
    }
}
