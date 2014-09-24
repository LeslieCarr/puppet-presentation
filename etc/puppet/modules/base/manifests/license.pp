class base::license {
    service { 'switchd':
          ensure     => running,
          hasstatus  => true,
          hasrestart => true,
          enable     => true
    }

    file { '/etc/cumulus/license.txt':
        owner  => root,
        group  => root,
        mode   => '0644',
        source => "puppet:///modules/base/${::hostname}.lic",
        notify => Service['switchd']
    }

    exec { '/usr/cumulus/bin/cl-license -i /etc/cumulus/license.txt; service switchd restart':
        subscribe   => File['/etc/cumulus/license.txt'],
        refreshonly => true
    }
}
