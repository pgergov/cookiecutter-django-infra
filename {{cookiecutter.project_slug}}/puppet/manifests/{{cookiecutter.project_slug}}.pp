node default {
  include python
  include hacksoft
  include apt

  exec { '/usr/bin/apt-get update':
    before => Class['apt']
  }

  ${{cookiecutter.project_slug}}_dir = '/hack/{{cookiecutter.project_slug}}'
  ${{cookiecutter.project_slug}}_domain = 'projectname.com'
  ${{cookiecutter.project_slug}}_debug_mode = 'False'
  ${{cookiecutter.project_slug}}_postgresql_password = template('vault/{{cookiecutter.project_slug}}/postgres_password.secret')
  $rabbitmq_password = template('vault/{{cookiecutter.project_slug}}/rabbitmq_password.secret')

  class { '{{cookiecutter.project_slug}}':
    user                => 'hack',
    application_root    => ${{cookiecutter.project_slug}}_dir,
    postgresql_password => ${{cookiecutter.project_slug}}_postgresql_password,
    postgresql_user     => '{{cookiecutter.project_slug}}',
    postgresql_db_name  => '{{cookiecutter.project_slug}}',
    env_filename        => ${{cookiecutter.project_slug}}_env_filename;
  }

  class { '{{cookiecutter.project_slug}}::nginx':
    server_name         => ${{cookiecutter.project_slug}}_domain,
    application_root    => ${{cookiecutter.project_slug}}_dir,
    require             => Class['{{cookiecutter.project_slug}}'];
  }

  class { 'postgresql::server': }

  postgresql::server::db { '{{cookiecutter.project_slug}}':
    user     => '{{cookiecutter.project_slug}}',
    password => postgresql_password('{{cookiecutter.project_slug}}', ${{cookiecutter.project_slug}}_postgresql_password),
  }

  exec { "rabbitmqctl change_password guest ${rabbitmq_password}":
    before => Class['{{cookiecutter.project_slug}}'],
    path  => ['/usr/bin', '/bin', '/usr/local/bin', '/usr/sbin/']
  }

  class { ::letsencrypt:
    email => 'support@hacksoft.io',
  }

  letsencrypt::certonly { 'foo':
    domains => [${{cookiecutter.project_slug}}_domain],
  }

  # # Give the hack user permission to restart the project 
  # sudoers { 'hack':
  #   commands => ['/sbin/start {{cookiecutter.project_slug}}', '/sbin/stop {{cookiecutter.project_slug}}', '/sbin/restart {{cookiecutter.project_slug}}']
  # }

}
