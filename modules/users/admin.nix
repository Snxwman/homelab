{ ... }:
{
    users.groups.admin = {};

    users.users.admin = {
        isNormalUser = true;
        createHome = true;
        name = "admin";
        uid = 1000;
        useDefaultShell = true;

        group = "admin";
        extraGroups = [ 
            "wheel"
            "audio"
            "video"
            "docker"
        ];
        
        # hashedPasswordFile = ;

        # openssh.authorizedKeys.keyFiles = [
        #     ../keys/admin.pub
        # ];
    };
}
