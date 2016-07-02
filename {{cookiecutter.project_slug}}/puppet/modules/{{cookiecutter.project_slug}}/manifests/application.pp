class {{cookiecutter.project_slug}}::application {
  require {{cookiecutter.project_slug}}

  File {
    owner => ${{cookiecutter.project_slug}}::user,
    group => ${{cookiecutter.project_slug}}::user
  }

  $user                = ${{cookiecutter.project_slug}}::user
  $home                = ${{cookiecutter.project_slug}}::home
  $application_root    = ${{cookiecutter.project_slug}}::application_root
  $postgresql_password = ${{cookiecutter.project_slug}}::postgresql_password
  $postgresql_user     = ${{cookiecutter.project_slug}}::postgresql_user
  $postgresql_db_name  = ${{cookiecutter.project_slug}}::postgresql_db_name
  $env_filename        = ${{cookiecutter.project_slug}}::env_filename


  file { "${application_root}/shared/env.vars":
      content => template("vault/{{cookiecutter.project_slug}}/${env_filename}")
  }

  # Create the upstart job to supervise the service.
  file { '/etc/init/{{cookiecutter.project_slug}}.conf':
    content => template('{{cookiecutter.project_slug}}/upstart.conf.erb'),
    require => Class['{{cookiecutter.project_slug}}']
  }

  # Supervise and run the process on boot.
  service { '{{cookiecutter.project_slug}}':
    ensure  => running,
    enable  => true,
    require => File['/etc/init/{{cookiecutter.project_slug}}.conf']
  }
}