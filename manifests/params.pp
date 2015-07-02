# Class: vendor::params
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
class vendor::params {

  $ensure     = 'present'
  $cfg_dir    = '/etc/vendor'
  $backup_cfg = "$cfg_dir/backup.cfg"
  $backup_svc = 'backupd'

  case $::osfamily {
    'RedHat': {
      $backup_pkg = 'vendor-backup-rhel'
      $install_options = '--enablerepo=vendor'
      $repo_file = 'puppet:///modules/vendor/vendor.repo'
      $repo_key = 'puppet:///modules/vendor/RPM-GPG-KEY-vendor'
    }
    'Debian': {
      $backup_pkg = 'vendor-backup-deb'
    }
    default: {
      fail("Unsupported osfamily: $::osfamily")
    }
  }
  
}
