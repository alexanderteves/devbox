class php {
    # TODO: installation of composer

    file {'/var/www':
        owner  => 'www-data',
        group  => 'www-data',
    }
    ->
    file {'/var/www/info.php':
        ensure  => file,
        owner   => 'www-data',
        group   => 'www-data',
        source  => 'puppet:///modules/php/info.php',
    }
    ->
    package {'php5':
        ensure => latest,
    }
    ->
    package {'php5-cli':
        ensure => latest,
    }
    ->
    package {'php5-fpm':
        ensure => latest,
    }
    ->
    package {'php5-sqlite':
        ensure => latest,
    }
    ->
    file {'/etc/php5/fpm/pool.d/www.conf':
        ensure => file,
        source => 'puppet:///modules/nginx/www.conf',
    }
    ->
    package {'apache2':
        ensure => absent,
    }
    ~>
    service {'apache2':
        ensure => stopped,
    }
    ~>
    service {'nginx':
        ensure => running,
    }
    ~>
    service {'php5-fpm':
        ensure => running,
    }
}

