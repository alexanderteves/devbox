class git {
    package { 'git':
        ensure => latest,
    }
    ->
    file { '/home/vagrant/.gitconfig':
        ensure => file,
        source => 'puppet:///modules/git/.gitconfig',
    }
}
