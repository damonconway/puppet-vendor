# Class: vendor::config
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
class vendor::config {

  $backup_cfg = $vendor::params::backup_cfg
  $ensure     = $vendor::ensure

  $ensure_cfg = $ensure ? {
    'absent' => 'absent',
    default  => 'file'
  }

  file { $backup_cfg:
    ensure  => $ensure_cfg,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('vendor/backup.cfg.erb'),
  }
  
}
