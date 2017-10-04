class ciemat_certs {
    include ciemat_certs::cron_config
    include ciemat_certs::install
    include ciemat_certs::logrotate
    include ciemat_certs::repository

    Class['ciemat_certs::repository'] -> Class['ciemat_certs::install']
}

