class php::apache::common inherits php {

  augeas { "default php.ini settings":
    load_path => "/usr/share/augeas/lenses/",
    context => "/files/${phpini}",
    changes => [
      "set PHP/allow_url_fopen Off",
      "set PHP/expose_php Off",
      "set PHP/enable_dl Off",
    ],
  }

  apache::module { "php5":
    ensure => present,
    require => Augeas["default php.ini settings"],
  }
}