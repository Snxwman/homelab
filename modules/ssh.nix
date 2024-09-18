{}:
{
    programs.ssh.startAgent = true;

    users.users."admin".openssh.authorizedKeys.keyFiles = [
        ./admin.pub
    ];

    services.openssh = {
        enable = true;
        ports = [ 22 ];
        openFirewall = true;
        settings = {
            PermitRootLogin = "no";
            PasswordAuthentication = false;
            KbdInteractiveAuthentication = false;
            AllowUsers = [
                "admin"
            ];
        };
    };

    services.fail2ban = {
        enable = true;
        maxretry = 5;
        bantime = "24hr";
        bantime-increment = {
            enable = true; # Enable increment of bantime after each violation
            formula = "ban.Time * math.exp(float(ban.Count+1)*banFactor)/math.exp(1*banFactor)";
            multipliers = "1 2 4 8 16 32 64";
            maxtime = "168h"; # Do not ban for more than 1 week
                overalljails = true; # Calculate the bantime based on all the violations
        };
        ignoreIP = [
            "10.0.0.0/8"
            "172.16.0.0/12"
            "192.168.0.0/16"
        ];
    };
}
