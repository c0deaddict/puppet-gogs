class gogs::params {
  $image                = 'gogs/gogs'
  $version              = 'latest'
  $ssh_host             = '0.0.0.0'
  $ssh_port             = 22
  $http_host            = '0.0.0.0'
  $http_protocol        = 'http'
  $offline_mode         = false
  $disable_ssh          = false
  $db_type              = 'sqlite3'
  $db_host              = 'localhost'
  $db_name              = 'gogs'
  $db_user              = 'root'
  $db_password          = ''
  $db_path              = 'data/gogs.db'
  $app_name             = 'Gogs: Go Git Service'
  $user                 = 1000
  $group                = 1000
  $http_internal_port   = 3000
  $ssh_internal_port    = 22
  $internal_data_dir    = '/data'
  $restart_service      = true
  $disable_registration = false
}
