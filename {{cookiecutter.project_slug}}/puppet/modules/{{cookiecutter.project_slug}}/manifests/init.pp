class {{cookiecutter.project_slug}}($user, $application_root, $postgresql_password, $postgresql_user, $postgresql_db_name, $env_filename) {
  File {
    owner => $user,
    group => $user
  }

  include {{cookiecutter.project_slug}}::packages

  ensure_resource(file, [
    "${application_root}",
    "${application_root}/releases",
    "${application_root}/shared",
    "${application_root}/shared/log",
    "${application_root}/shared/media",
    "${application_root}/shared/staticfiles",
  ], {
    ensure => 'directory'
  })

  class { '{{cookiecutter.project_slug}}::application':
    require => File["${application_root}/shared/"]
  }
}