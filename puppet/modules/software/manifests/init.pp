class software {
    exec {'apt':
        command => '/usr/bin/apt-get update',
    }
}

