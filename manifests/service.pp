# Class: vendor::service
#
# This class does stuff that you describe here
#
# Parameters:
#   $parameter:
#       this global variable is used to do things
#
# Actions:
#   Actions should be described here
#
# Requires:
#   - Package["foopackage"]
#
# Sample Usage:
#
class vendor::service {

  $backup_cfg = $vendor::params::backup_cfg
  $backup_svc = $vendor::params::backup_svc
  $ensure     = $vendor::ensure

  $ensure_svc = $ensure ? {
    'absent' => 'stopped',
    default  => 'running',
  }

  service { 'backup_svc':
    ensure    => $ensure_svc,
    subscribe => File[$backup_cfg],
  }
  
}
