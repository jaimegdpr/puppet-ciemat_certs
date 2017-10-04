class ciemat_certs::service {

    service {['fetch-crl-boot','fetch-crl-cron']:
        ensure => stopped,
        enable => false,
    }

}
