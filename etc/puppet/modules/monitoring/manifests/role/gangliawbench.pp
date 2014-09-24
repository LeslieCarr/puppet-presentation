class monitoring::role::gangliawbench {
    include base::puppet,
      monitoring::gangliawebhost

    class {'monitoring::ganglia':
      gangliatype => 'wbench'
    }
}
