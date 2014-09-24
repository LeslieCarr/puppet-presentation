class monitoring::sflowwebhost {
  package { [ 'apache2', 'libapache2-mod-php5' ]:
    ensure => installed
  }

  service { 'apache2':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['apache2'],
  }

  file { '/etc/apache2/sites-available/sflow-rt.lab.local.conf':
    ensure  => present,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
    content => template('monitoring/sflow-rt.lab.local.conf.erb'),
    notify  => Service['apache2'],
  }

  file { '/etc/apache2/sites-enabled/sflow-rt.lab.local.conf':
    ensure  => link,
    target  => '/etc/apache2/sites-available/sflow-rt.lab.local.conf',
    require => File['/etc/apache2/sites-available/sflow-rt.lab.local.conf'],
  }

  file { '/var/www/index.html':
    ensure  => present,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
    content => template('monitoring/index.html.erb'),
    notify  => Service['apache2']
  }

  file { '/etc/apache2/sites-enabled/15-default.conf':
    ensure => absent,
    notify => Service['apache2']
  }

  file { '/etc/apache2/sites-enabled/000-default':
    ensure => absent,
    notify => Service['apache2']
  }

}
