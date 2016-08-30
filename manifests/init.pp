#
# == Class: tomcat
#
# Install and configure Tomcat and setup wars
#
# == Parameters
#
# [*manage*]
#  Whether to manage tomcat with Puppet or not. Valid values are true (default) 
#  and false.
# [*ensure*]
#   Status of Tomcat. Valid values are 'present' (default) and 'absent'.
# [*package_name*]
#   Name of the Tomcat package. Defaults to $::tomcat::params::package_name.
# [*allow_address_ipv4*]
#   IPv4 address/network from which to allow connections through the firewall.
#   Only affects packet filtering rules on nodes which have included the
#   'packetfilter' class. A special value, 'any', can be used to allow any hosts
#   from any IPv4 address to this service. Defaults to '127.0.0.1'.
# [*allow_address_ipv6*]
#   IPv6 address/network from which to allow connections through the firewall.
#   The same options/limitations apply as for $allow_address_ipv4. Defaults to
#   '::1'.
#
# == Authors
#
# Reid Vandewiele / Puppet Labs
# 
# Samuli Seppänen <samuli@openvpn.net>
#
class tomcat
(
    Boolean $manage = true,
            $ensure = 'present',
            $package_name = $::tomcat::params::package_name,
            $allow_address_ipv4 = '127.0.0.1',
            String $allow_address_ipv6 = '::1'

) inherits tomcat::params
{

if $manage {

    include ::java

    class { '::tomcat::install':
        ensure       => $ensure,
        package_name => $package_name,
    }

    class { '::tomcat::service':
        ensure => $ensure,
    }

    class { '::tomcat::config':
        ensure => $ensure,
    }

    if tagged('packetfilter') {
        class { '::tomcat::packetfilter':
            ensure             => $ensure,
            allow_address_ipv4 => $allow_address_ipv4,
            allow_address_ipv6 => $allow_address_ipv6,
        }
    }
}
}
