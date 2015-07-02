# Class: puppet-vendor
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
class init (
  $client_token,
  $backup_enable = $vendor::params::enable,
  $ensure = $vendor::params::ensure,
) inherits vendor::params {

  include vendor::install
  include vendor::config
  include vendor::service

  Class['vendor::install']->
  Class['vendor::config']->
  Class['vendor::service']
  
}
