class test {

    class { "devpro":
        target => "test",
        base_dir => "/opt/devpro",
        domain => "test.devpro.sophilabs.com",
        user => "jenkins",
        group => "jenkins";
    }

}


class { "test": }