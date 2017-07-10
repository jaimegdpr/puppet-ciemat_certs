class ciemat_certs::install {

    yumrepo { 'igtfca':
        ensure => present,
        enabled => 1,
        before => Package['ca-policy-egi-core'],
    }

    package {'ca-policy-egi-core':
        ensure => latest,
    }

}
