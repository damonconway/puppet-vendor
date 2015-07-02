# Class: vendor::install
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
class vendor::install {

  $backup_pkg      = $vendor::params::backup_pkg
  $ensure          = $vendor::ensure
  $install_options = $vendor::install_options

  package { 'vendor_backup_pkg':
    ensure          => $ensure,
    install_options => $install_options,
    name            => $backup_pkg,
  }
  
}
