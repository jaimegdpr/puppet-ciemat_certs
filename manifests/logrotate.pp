class ciemat_certs::logrotate {

    # Set logrotate rule
    logrotate::rule {'fetch-crl':
        path => '/var/log/fetch-crl-cron.log',
        rotate => 12,
        rotate_every => 'month',
        compress => true,
        missingok => true,
        ifempty => true,
        create => true,        
    }

}
