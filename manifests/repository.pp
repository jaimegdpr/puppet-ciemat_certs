class ciemat_certs::repository {

    yumrepo { 'EGI-trustanchors':
        name => 'EGI-trustanchors',
        descr => 'EGI-trustanchors',
        baseurl => 'http://repository.egi.eu/sw/production/cas/1/current/',
        protect => 0,
        enabled => 1,
        gpgcheck => 1,
        gpgkey => 'http://repository.egi.eu/sw/production/cas/1/GPG-KEY-EUGridPMA-RPM-3',
        before => Package['ca-policy-egi-core'],
    }

}
