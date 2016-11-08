class koticonf {

       exec { 'setxkbmap':

       command => '/usr/bin/setxkbmap fi'

       }

       exec { 'xinput':

       command => '/usr/bin/xinput set-prop "ETPS/2 Elantech Touchpad" "Synaptics Finger" 10 10 255'

       }

       exec { 'apt-update':

       command => '/usr/bin/apt-get update'

       }

       package {'pinta':

       require => Exec['apt-update'],

       ensure => installed,

       allowcdrom => true,

       }

       package { 'apache2':

       require => Exec['apt-update'],

       ensure => installed,

       allowcdrom => true,

       }

       service { 'apache2':

       ensure => running,

       }

       package { 'mysql-server':

       require => Package['apache2'],

       ensure => installed,

       allowcdrom => true,

       }

       package { 'mysql-client':

       require => Package['mysql-server'],

       ensure => installed,

       allowcdrom => true,

       }

      service { 'mysql':

      ensure => running,

      provider => systemd,

      require => Package['mysql-server'],

      }

      package { 'php':

      require => Package['mysql-server'],

      ensure => installed,

      allowcdrom => true,

      }

      package { 'libapache2-mod-php':

      require => Package['php'],

      ensure => installed,

      allowcdrom => true,

      }

      package { 'php-mysql':

      require => Package['libapache2-mod-php'],

      ensure => installed,

      allowcdrom => true,

      }

      package { ssh:

      require =>Exec[‘apt-update’]

      ensure => installed,

      allowcdrom => true,

      }

      service { "ssh":

      ensure => "running",

      provider => "systemd",

      }     

      file { '/etc/ssh/sshd_config':

      content => template("koticonf/sshd_config"),

      notify => Service["ssh"],

      }

}
