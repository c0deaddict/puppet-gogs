class gogs::install {

  include '::docker'
  
  docker::image { $gogs::image:
    ensure     => $gogs::ensure,
    image_tag  => $gogs::version,
  }

}
