class gogs::config {  

  file { [$gogs::data_dir, "${gogs::data_dir}/gogs", "${gogs::data_dir}/gogs/conf"]:
    ensure => $gogs::ensure ? {
      absent   => absent,
      default  => directory,
    },
    owner => $gogs::params::user,
    group => $gogs::params::group,
    mode => '0755',
  } ->
  file { "${gogs::data_dir}/ssh":
    ensure => $gogs::ensure ? {
      absent   => absent,
      default  => directory,
    },
    owner => $gogs::params::user,
    group => $gogs::params::group,
    mode => '0700',
  }

  file { "${gogs::data_dir}/gogs/conf/app.ini":
    ensure => $gogs::ensure,
    owner => $gogs::params::user,
    group => $gogs::params::group,
    mode => '0600',
    content => template('gogs/app.ini.erb'),
    require => File["${gogs::data_dir}/gogs/conf"],
  }

}
