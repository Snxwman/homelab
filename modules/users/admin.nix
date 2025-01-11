{ ... }:
{
    users.groups.admin = {};

    users.users.admin = {
        name = "admin";
        uid = 1000;
        isNormalUser = true;
        createHome = true;
        useDefaultShell = true;
        initialPassword = "admin";

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
