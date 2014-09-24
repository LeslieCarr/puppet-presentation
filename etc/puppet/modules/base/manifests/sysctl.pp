class base::sysctl {

  sysctl { 'net.ipv4.conf.all.arp_filter': value => '0' }

}
