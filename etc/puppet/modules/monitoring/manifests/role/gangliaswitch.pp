class monitoring::role::gangliaswitch {
    include base::role::switch,
      base::ptm,
      ospfunnum::quagga

    class {'monitoring::ganglia':
      gangliatype => 'switch'
    }
}
