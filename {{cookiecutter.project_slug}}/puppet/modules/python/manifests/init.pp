class python($version = '3') {
  # Install Python and the its development headers.
  package {
    [
      "python${version}",
      "python${version}-dev",
      "python${version}-pip",
      "python-pip",
      "python-setuptools",
      "python3-setuptools"
    ]:
  }

  # Install PIP only if it isn't currently installed.
  -> exec { "pip${version} install virtualenv":
    path   => ['/usr/bin', '/bin', '/usr/local/bin'],
  }
}