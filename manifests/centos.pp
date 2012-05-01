class nfs::centos inherits nfs::base {
# not sure if this used on all systems so
# moved it to centos
  service {
    nfslock :
      ensure => running,
      enable => true,
      hasstatus => true,
      require => Package[nfs-utils] ;

    ["rpcgssd", "rpcidmapd", "rpcsvcgssd"] :
      ensure => stopped,
      enable => false,
      require => Package[nfs-utils] ;
  }
  case $lsbmajdistrelease {
    '6' : {
      package {
        'rpcbind' :
          ensure => installed,
      }
      Service['portmap'] {
        name => 'rpcbind',
        require => Package['rpcbind'],
      }
    }
  }
}
