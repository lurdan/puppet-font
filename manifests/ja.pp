define font::ja ( $type = 'all' ) {
  case $name {
    'vlgothic': {
      $mincho = false
      case $::operatingsystem {
        /(?i-mx:debian|ubuntu)/: {
          $gothic = 'ttf-vlgothic'
        }
        /(?i-mx:redhat|centos)/: {
          $gothic = 'vlgothic-fonts'
        }
      }
    }
    'ipa': {
      case $::operatingsystem {
        /(?i-mx:debian|ubuntu)/: {
          $gothic = $::lsbdistcodename ? {
            'squeeze' => 'otf-ipafont-gothic',
            default => 'fonts-ipafont-gothic',
          }
          $mincho = $::lsbdistcodename ? {
            'squeeze' => 'otf-ipafont-mincho',
            default => 'fonts-ipafont-mincho',
          }
        }
        /(?i-mx:redhat|centos)/: {
          $gothic = [ 'ipa-gothic-fonts', 'ipa-pgothic-fonts' ]
          $mincho = [ 'ipa-mincho-fonts', 'ipa-pmincho-fonts' ]
        }
      }
    }
    'takao': {
      case $::operatingsystem {
        /(?i-mx:debian|ubuntu)/: {
          $gothic = $::lsbdistcodename ? {
            'squeeze' => 'ttf-takao-gothic',
            default => 'fonts-takao-gothic',
          }
          $mincho = $::lsbdistcodename ? {
            'squeeze' => 'ttf-takao-mincho',
            default => 'fonts-takao-mincho',
          }
        }
      }
    }
  }

  if $gothic {
    if $type != 'mincho' {
      package { $gothic: ensure => installed }
    }
  }
  if $mincho {
    if $type != 'gothic' {
      package { $mincho: ensure => installed }
    }
  }
}


#    'ttf-aoyagi-kouzan-t':;
#    'ttf-aoyagi-soseki':;
#    'ttf-dejavu':;
#    'ttf-dejima-mincho':;
#    'ttf-hanazono':;
#    'ttf-indic-fonts':;
#    'ttf-kiloji':;
#    'ttf-kochi-gothic':;
#    'ttf-kochi-mincho':;
#    'ttf-kouzan-mouhitsu':;
#    'ttf-misaki':;
#    'ttf-monapo':;
#    'ttf-sawarabi-gothic':;
#    'ttf-sawarabi-mincho':;
#    'ttf-sazanami-gothic':;
#    'ttf-sazanami-mincho':;
#    'ttf-umefont':;
#    'ttf-umeplus':;
#    'ttf-vlgothic':;
#    'ttf-mona':;
