class base::install{
    yumrepo { 'base-remi':
        descr => 'remi repo',
        mirrorlist => 'http://rpms.famillecollet.com/enterprise/6/remi/mirror',
        enabled    => 1,
        gpgcheck   => 1,
        gpgkey     => 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi',
    }

    package{
        [
        'openssh-clients',
        'wget',
        'screen',
        'unzip',
        'make',
        'git',
        'dstat',
        'siege',
        'npm',
        'tree',
        'cronie-noanacron',
        ]:
        ensure => installed,
        require => Yumrepo['base-remi'],
    }

    package{
        [
        'cronie-anacron',
        ]:
        ensure => purged,
        require => Yumrepo['base-remi'],
    }
}
