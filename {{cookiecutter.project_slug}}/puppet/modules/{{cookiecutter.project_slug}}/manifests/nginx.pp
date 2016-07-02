class {{cookiecutter.project_slug}}::nginx($server_name, $application_root) {

  ::nginx::vhost { $server_name:
    content => template('{{cookiecutter.project_slug}}/nginx.conf.erb'),
    require => Class['{{cookiecutter.project_slug}}']
  }
}