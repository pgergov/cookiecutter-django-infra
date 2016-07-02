class nginx {
  # Add a PPA for the stable release and install the latest package.
  apt::ppa { 'ppa:nginx/stable': } -> package { 'nginx': ensure => installed }

  # Disable the default site.
  file { '/etc/nginx/sites-enabled/default':
    ensure => absent,
    notify  => Service['nginx'],
    require => Package['nginx']
  }

  # Start nginx right now and also on boot.
  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx']
  }
}