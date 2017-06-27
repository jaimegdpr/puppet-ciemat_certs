class ciemat_certs {
    include ciemat_certs::cron
    include ciemat_certs::install
    include ciemat_certs::logrotate
}

