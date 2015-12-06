define gogs::ssh_host_key(
  $privkey_content,
  $pubkey_content,
) {

  $ssh_dir = "${gogs::data_dir}/ssh"
  $base_filename = "${ssh_dir}/ssh_host_${name}_key"

  file { $base_filename:
    ensure => $gogs::ensure,
    owner => $gogs::user,
    group => $gogs::group,
    mode => '0600',
    require => File[$ssh_dir],
  }

  file { "${base_filename}.pub":
    ensure => $gogs::ensure,
    owner => $gogs::user,
    group => $gogs::group,
    mode => '0600',
    require => File[$ssh_dir],
  }

}
