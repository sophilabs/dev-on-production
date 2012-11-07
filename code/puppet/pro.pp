class pro {

    class { "devpro":
        target => "pro",
        base_dir => "/opt/devpro",
        domain => "devpro.sophilabs.com",
        user => "devpro",
        group => "devpro";
    }

}


class { "pro": }
