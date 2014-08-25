class nginx {
    package {'nginx':
        ensure => latest,
    }
    ->
    file {'/etc/nginx/sites-enabled/default':
        ensure => absent,
    }
    ->
    file {'/etc/nginx/sites-enabled/phpfpm':
        ensure => file,
        source => 'puppet:///modules/nginx/phpfpm',
    }
}

