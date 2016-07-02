# Configures automatic package upgrades for Ubuntu based systems.
#
# By default, only security updates are installed.
class hacksoft::upgrades {
  package { 'unattended-upgrades': }

  # See https://help.ubuntu.com/community/AutomaticSecurityUpdates for more
  # information.
  file { '/etc/apt/apt.conf.d/20auto-upgrades':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/hacksoft/20auto-upgrades',
    require => Package['unattended-upgrades']
  }
}