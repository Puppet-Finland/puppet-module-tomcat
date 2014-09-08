#
# == Class: tomcat::packetfilter
#
# Configures packetfiltering rules for tomcat. Currently only allows one IP 
# address or a range for IPv4 and IPv6, but this could be easily extended to 
# support lists of ranges.
#
class tomcat::packetfilter
(
    $allow_address_ipv4,
    $allow_address_ipv6
)
{
    # IPv4 rules
    firewall { '003 ipv4 accept tomcat':
        provider => 'iptables',
        chain  => 'INPUT',
        proto => 'tcp',
        # Set the allowable source address, unless 'any', in which case the 
        # 'source' parameter is left undefined.
        source => $allow_address_ipv4 ? {
            'any' => undef,
            default => $allow_address_ipv4,
        },
        dport => 8080,
        action => 'accept',
    }

    firewall { '004 ipv4 accept tomcat':
        provider => 'iptables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $allow_address_ipv4 ? {
            'any' => undef,
            default => $allow_address_ipv4,
        },
        dport => 8443,
        action => 'accept',
    }

    # IPv6 rules
    firewall { '003 ipv6 accept tomcat':
        provider => 'ip6tables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $allow_address_ipv6 ? {
            'any' => undef,
            default => $allow_address_ipv6,
        },
        dport => 8080,
        action => 'accept',
    }

    firewall { '004 ipv6 accept tomcat':
        provider => 'ip6tables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $allow_address_ipv6 ? {
            'any' => undef,
            default => $allow_address_ipv6,
        },
        dport => 8443,
        action => 'accept',
    }
}
