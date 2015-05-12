#
# == Class: tomcat::app::docs
#
# Install Tomcat Docs package
#
class tomcat::app::docs inherits tomcat::params {

    package { $::tomcat::params::docs_package:
        ensure => installed,
        notify => Class['tomcat::service'],
    }
}
