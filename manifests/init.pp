class ciemat_certs {
    include ciemat_certs::cron_config
    include ciemat_certs::install
    include ciemat_certs::logrotate
    include ciemat_certs::repository
    include ciemat_certs::service

    Class['ciemat_certs::repository'] ->
    Class['ciemat_certs::install']      ->
    Class['ciemat_certs::service']
}

