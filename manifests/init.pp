# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include review
class review (
  $user = 'review',
) {
  $homedir = $user ? {
    'root'  => '/root',
    default => "/home/${user}",
  }

  user { $user:
    ensure     => present,
    home       => $homedir,
    managehome => true,
  }

  file { "${homedir}/.bashrc":
    ensure => file,
    owner  => $user,
    group  => $user,
  }

  service { 'puppet':
    ensure => stopped,
  }

  include review::motd
}
