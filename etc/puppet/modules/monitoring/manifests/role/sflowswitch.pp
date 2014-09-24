class monitoring::role::sflowswitch {
    include base::role::switch,
      base::ptm,
      ospfunnum::quagga,
      monitoring::hsflowd,
      monitoring::tools
}
