class ciemat_certs::cron_config {

    $random_hour = fqdn_rand(6, 'adding more randomness with this seed')
    $random_hour_plus_6h = $random_hour + 6
    $random_hour_plus_12h = $random_hour + 12
    $random_hour_plus_18h = $random_hour + 18

    cron::job::multiple { 'ciemat-fetch-crl':
        jobs => [
          {
            minute      => fqdn_rand(60, 'adding more randomness with this seed'),
            hour        => "${random_hour},${random_hour_plus_6h},${random_hour_plus_12h},${random_hour_plus_18h}",
            date        => '*',
            month       => '*',
            weekday     => '*',
            user        => 'root',
            command     => 'rsync -u --chmod=u+rw,g+r,o+r lcg01::glite/CRL/*  /etc/grid-security/certificates/  >> /var/log/fetch-crl-cron.log 2>&1',
            environment => [ 'MAILTO=root', 'PATH="/sbin:/bin:/usr/sbin:/usr/bin"' ],
            description => 'Get crls from lcg01',
          },
          {
            minute => '@reboot',
            hour        => '',
            date        => '',
            month       => '',
            weekday     => '',
            user        => 'root',
            command     => 'rsync -u --chmod=u+rw,g+r,o+r lcg01::glite/CRL/*  /etc/grid-security/certificates/  >> /var/log/fetch-crl-cron.log 2>&1',
          },
        ],
        environment => [ 'MAILTO=root', 'PATH="/sbin:/bin:/usr/sbin:/usr/bin"' ],
    } 

        file { '/etc/cron.d/fetch-crl':
            ensure => absent,
    }

}
