class software::development {
    package {'python-dev':
        ensure => latest,
    }

    package {'python-pip':
        ensure => latest,
    }

    package {'vim':
        ensure => latest,
    }
}

