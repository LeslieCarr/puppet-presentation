class base::interfaces {

    if $int_enabled == undef {
        $int_enabled = false
    }

    if ($int_enabled == true) {
      file { '/etc/network/interfaces':
              owner   => root,
              group   => root,
              mode    => '0644',
              content => template('base/interfaces.erb')
      }

      service { 'networking':
              ensure     => running,
              subscribe  => File['/etc/network/interfaces'],
              hasrestart => true,
              enable     => true,
              hasstatus  => false,
              require    => File['/etc/cumulus/license.txt']
      }
    }

}
