class gogs::ssh_host_keys($ssh_host_keys = {}) {
  
  $hiera_ssh_host_keys = hiera_hash('gogs::ssh_host_keys', undef)
  $actual_ssh_host_keys = $hiera_ssh_host_keys ? {
    undef    => $ssh_host_keys,
    default  => $hiera_ssh_host_keys,
  }

  create_resources('gogs::ssh_host_key', $actual_ssh_host_keys)

}
