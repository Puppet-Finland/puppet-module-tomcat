#
# == Class: tomcat::install
#
# Install Tomcat
#
class tomcat::install
(
    Enum['present', 'absent'] $ensure,
    String                    $package_name

) inherits tomcat::params
{
    package { 'tomcat':
        ensure => $ensure,
        name   => $package_name,
    }
}
