class monitoring::hsflowd {
  # Warning: this class will not properly work until 2.1

  package { 'hsflowd':
    ensure => installed;
  }

  service { 'hsflowd':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['hsflowd']
  }
}
