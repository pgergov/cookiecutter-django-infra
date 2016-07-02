class hacksoft::auth {
  Ssh_authorized_key {
    user    => 'root',
    type    => 'ssh-rsa'
  }

  # Give everybody in the hack team a root access to the server.
  ssh_authorized_key {
    'ivaylo':    key => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDnBW4R/4Wx7CCBuyadx6+HcGZY54+F3YTeGLkMhUkLvUPvxyiyrBCHt8/XuVQif3TnySVY6cKq/Il6wO4i8I3UBQmx8kr6Bugu2WOW3uP7jXQpmMaoMgd+WyDYwCUqulr0PsUDqq1RBcFB/EbnOEaSepiWeKZ+7J0feOXiS16UmKJ/vvbt2hNOdaM00O1Wirnw3hCqJNC519ts803NpREwWJa46uw3Wwb7XWsFMOcEXZqKQ5+YFvGVdQk5S13ms28rJfGYAEuAH/bR73mfF+2W+/pfXzOEpn5UecEGQgqg5d0tnPRnALG9DMJdhWXBiKTQWR3qNCLpFCOaD9tMWSTez86UIZaFRLFTnXn7KYrPsj1s4RJXI//60uz1XAGGbQuwuSezt5XoWrYP453h2i1Vu4jjtyIRySn3Cz04LZPf/2NsUm/egm8bP+DneTIXOceHUnKEEMsbyiC8GLS8C/yc8hIT8ucceQe9koBgC0Ay+zCuz8xH0lDFA4MLT1dd+wUuA+lRShY5h5BWJ2/iEI/sXEKn33YjGUamHvCXEqwimt0CZsy2uFujJBka8HC6HNPXtd4h3CGur1oNBZGpT8OLtSwb8s0OgBo/Ju6iizmYI5IoG97gIf274Jg814SX8TMjP04SmaRz+fpSL2gHm72B9NQWjI7wGLKbwhtbqEf0wQ==';
  }
}