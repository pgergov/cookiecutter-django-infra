class {{cookiecutter.project_slug}}::packages {
  ensure_packages(['libpq-dev', 'git', 'rabbitmq-server'])
}