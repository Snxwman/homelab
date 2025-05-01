{ pkgs, ... }:
{
    users.users.root = {
        # isNormalUser = false;
        # name = "root";
        # uid = 0;
        # description = "System administrator";

        # cryptHomeLuks = "";  # TODO:
        # createHome = false;
        # home = "/root";
        # homeMode = "700";

        # useDefaultShell = true;
        hashedPasswordFile = "/homelab/secrets/root-washington.passwd";

        # group = "root";
        # extraGroups = [ 
        # ];

        # packages = with pkgs; [];
    };
}
