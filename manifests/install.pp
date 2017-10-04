class ciemat_certs::install {

    package {'ca-policy-egi-core':
        ensure => latest,
    }

}
