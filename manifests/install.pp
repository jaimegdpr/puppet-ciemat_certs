class ciemat_certs::install {

    require ciemat_certs::repositories

    package {'ca-policy-egi-core':
        ensure => latest,
    }

}
