# class { 'font':
#   lang => 'ja'
# }
# font::en { 'inconsolata': }

class font ( $lang ) {
  case $lang {
    'ja': {
      @font::ja {
        'vlgothic':;
        'ipa':;
        'takao':;
      }
    }
  }
}
