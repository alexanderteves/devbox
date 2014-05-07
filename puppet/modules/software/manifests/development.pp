class software::development {
    package { 'couchdb':
        ensure => latest,
    }
    ->
    exec { 'couchdb_bind_address':
        command => 'sed -i -E "s|(bind_address = )127\.0\.0\.1|\10\.0\.0\.0|" /etc/couchdb/default.ini',
        path => ['/usr/bin', '/usr/sbin', '/bin'],
        unless => 'grep bind_address\ =\ 0.0.0.0 /etc/couchdb/default.ini',
    }

    package { 'python-dev':
        ensure => latest,
    }

    package { 'python-pip':
        ensure => latest,
    }

    package { 'jenkins':
        ensure => latest,
    }
    ~>
    service { 'jenkins':
        ensure => running,
    }
    
    package { 'vim':
        ensure => latest,
    }
}