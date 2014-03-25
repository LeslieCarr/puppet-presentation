class dhcp::params {

  case $operatingsystem {
    'debian': {
      $dhcp_dir    = '/etc/dhcp'
      $packagename = 'isc-dhcp-server'
      $servicename = 'isc-dhcp-server'
      $dhcpd       = '/usr/sbin/dhcpd'
    }
    'ubuntu': {
      if versioncmp($::operatingsystemrelease, '12.04') >= 0 {
        $dhcp_dir    = '/etc/dhcp'
      } else {
        $dhcp_dir    = '/etc/dhcp3'
        $dhcpd       = '/usr/sbin/dhcpd'
      }
      $packagename = 'isc-dhcp-server'
      $servicename = 'isc-dhcp-server'
    }
    'darwin': {
      $dhcp_dir    = '/opt/local/etc/dhcp'
      $packagename = 'dhcp'
      $servicename = 'org.macports.dhcpd'
    }
    'freebsd': {
      $dhcp_dir    = '/usr/local/etc'
      $packagename = 'net/isc-dhcp42-server'
      $servicename = 'isc-dhcpd'
      $dhcpd       = '/usr/local/sbin/dhcpd'
    }
    'redhat','fedora','centos': {
      $dhcp_dir    = '/etc/dhcp'
      $packagename = 'dhcp'
      $servicename = 'dhcpd'
    }
  }

}
