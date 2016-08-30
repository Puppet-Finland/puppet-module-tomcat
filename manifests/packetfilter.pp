#
# == Class: tomcat::packetfilter
#
# Configures packetfiltering rules for tomcat. Currently only allows one IP 
# address or a range for IPv4 and IPv6, but this could be easily extended to 
# support lists of ranges.
#
class tomcat::packetfilter
(
    Enum['present','absent'] $ensure,
    String                   $allow_address_ipv4,
    String                   $allow_address_ipv6

) inherits tomcat::params
{

    # Common firewall parameters
    Firewall {
        ensure => $ensure,
        chain  => 'INPUT',
        proto  => 'tcp',
        action => 'accept',
    }

    # IPv4 rules
    $source_v4 = $allow_address_ipv4 ? {
        'any'   => undef,
        default => $allow_address_ipv4,
    }

    firewall { '003 ipv4 accept tomcat':
        provider => 'iptables',
        source   => $source_v4,
        dport    => 8080,
    }

    firewall { '004 ipv4 accept tomcat':
        provider => 'iptables',
        source   => $source_v4,
        dport    => 8443,
    }

    # IPv6 rules
    $source_v6 = $allow_address_ipv6 ? {
        'any'   => undef,
        default => $allow_address_ipv6,
    }

    firewall { '003 ipv6 accept tomcat':
        provider => 'ip6tables',
        source   => $source_v6,
        dport    => 8080,
    }

    firewall { '004 ipv6 accept tomcat':
        provider => 'ip6tables',
        source   => $source_v6,
        dport    => 8443,
    }
}
