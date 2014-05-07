class software::system {
    package { 'curl':
        ensure => latest,
    }

    package { 'htop':
        ensure => latest,
    }
    
    package { 'aptitude':
        ensure => latest,
    }
}
