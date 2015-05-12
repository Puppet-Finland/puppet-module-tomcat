#
# == Class: tomcat::app::admin
#
# Install the Tomcat Admin app
#
class tomcat::app::admin inherits tomcat::params {

    package { $::tomcat::params::admin_package:
        ensure => installed,
        notify => Class['tomcat::service'],
    }
}
