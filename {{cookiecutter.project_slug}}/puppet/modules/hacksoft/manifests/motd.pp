class hacksoft::motd {
  file { '/etc/motd':
    source => 'puppet:///modules/hacksoft/motd'
  }
}