class dev {

    class { "devpro":
        target => "dev",
        base_dir => "/opt/devpro",
        domain => "local.devpro.sophilabs.com",
        user => "vagrant",
        group => "vagrant";
    }

}


class { "dev": }
