# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include scratch
class scratch {
  case $facts['kernel'] {
    'linux': {
      $scratch = '/var/tmp/scratch.wtf'
      $bogus = '/bogus/path/surely/does/not/exist/scratch.wtf'
      exec { "touch ${scratch}":
        creates => $scratch,
        path    => ['/usr/bin', '/bin'],
      }

      $se = scratch::existence($scratch)
      $be = scratch::existence($bogus)

      notify { "scratch exists: ${se}\nbogus exists: ${be}": }
    }
    default: {}
  }
}
