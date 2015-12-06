class gogs(
  $data_dir,
  $domain,
  $ensure           = present,
  $root_url         = undef,
  $secret_key       = undef,
  $image            = $gogs::params::image,
  $version          = $gogs::params::version,
  $ssh_host         = $gogs::params::ssh_host,
  $ssh_port         = $gogs::params::ssh_port,
  $http_host        = $gogs::params::http_host,
  $http_protocol    = $gogs::params::http_protocol,
  $http_port        = undef,
  $offline_mode     = $gogs::params::offline_mode,
  $disable_ssh      = $gogs::params::disable_ssh,
  $db_type          = $gogs::params::db_type,
  $db_host          = $gogs::params::db_host,
  $db_name          = $gogs::params::db_name,
  $db_user          = $gogs::params::db_user,
  $db_password      = $gogs::params::db_password,
  $db_path          = $gogs::params::db_path,
  $app_name         = $gogs::params::app_name,
  $restart_service  = $gogs::params::restart_service,
  $memory_limit     = undef
) inherits gogs::params {
 
  $actual_http_port = $http_port ? {
    undef => $http_protocol ? {
      'https' => 443,
      default => 80,
    },
    default => $http_port,
  }

  $actual_root_url = $root_url ? {
    undef   => "${http_protocol}://${domain}:${actual_http_port}/",
    default => $root_url,
  }

  class { 'gogs::install': } ->
  class { ['gogs::config', 'gogs::ssh_host_keys']: } ~>
  class { 'gogs::service': }

  contain gogs::install
  contain gogs::config
  contain gogs::ssh_host_keys
  contain gogs::service

}
