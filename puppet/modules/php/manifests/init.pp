class php {
    file {'/var/www':
        owner  => 'www-data',
        group  => 'www-data',
    }

    package { 'php5':
        ensure => latest,
    }
    ->
    package { 'php5-cli':
        ensure => latest,
    }
    ->
    package { 'php5-fpm':
        ensure => latest,
    }
    ->
    file {'/etc/php5/fpm/pool.d/www.conf':
        ensure => file,
        source => 'puppet:///modules/nginx/www.conf',
    }
    ~>
    service {'php5-fpm':
        ensure => running,
    }
}