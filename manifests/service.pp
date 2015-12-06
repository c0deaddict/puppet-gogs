class gogs::service {

  $http_only_ports = ["${gogs::http_host}:${gogs::http_actual_port}:${gogs::params::http_internal_port}"]
  $actual_ports = $gogs::disable_ssh ? {
    true     => $http_only_ports,
    default  => concat($http_only_ports, "${gogs::ssh_host}:${gogs::ssh_port}:${gogs::params::ssh_internal_port}")
  }
  
  docker::run { 'gogs':
    image => "${gogs::image}:${gogs::version}",
    ports => $actual_ports,
    volumes => ["${gogs::data_dir}:${gogs::params::internal_data_dir}"],
    memory_limit => $gogs::memory_limit,
    restart_service => $gogs::restart_service,
  }

}
