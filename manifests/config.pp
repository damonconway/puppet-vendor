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

  $backup_cfg    = $vendor::params::backup_cfg
  $backup_enable = $vendor::params::backup_enable
  $client_token  = $vendor::client_token
  $ensure        = $vendor::ensure

  $ensure_cfg = $ensure ? {
    'absent' => 'absent',
    default  => 'file'
  }

  if str2bool($backup_enable) {
    file { $backup_cfg:
      ensure  => $ensure_cfg,
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      content => template('vendor/backup.cfg.erb'),
    }
  }
  
}
