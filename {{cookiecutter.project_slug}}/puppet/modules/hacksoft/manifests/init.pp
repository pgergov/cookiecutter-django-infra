class hacksoft {
  include hacksoft::auth
  include hacksoft::motd
  include hacksoft::upgrades

  # # Let all the machines get modern monitoring tools.
  package { 'glances':
    provider => 'pip'
  }

  package { 'bash': }

  # All the machines have hack user with /hack dir. 
  user { 'hack':
    ensure      => present,
    managehome  => true,
    shell       => '/bin/bash',
    require     => Package['bash']
  }

  file { '/hack':
    ensure  => 'directory',
    owner   => 'hack',
    group   => 'hack',
    require => User['hack']
  }
}