{ config, pkgs, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ./jellyfin.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "orion";

    time.timeZone = "America/New_York";

    security.sudo.enable = true;

    nix = {
        package = pkgs.nixUnstable;
        trustedBinaryCaches = [
            "http://cache.nixos.org"
        ];

        binaryCaches = [
            "http://cache.nixos.org"
        ];

        gc.automatic = false;
        maxJobs = pkgs.stdenv.lib.mkForce 6;
    };

    nixpkgs = {
        system = "x86_64-linux";
        config = {
            allowUnfree = true;
        };
    };

    system.autoUpgrade = {
        enable = true;
        allowReboot = true;
    };

    users.users."admin".openssh.authorizedKeys.keyFiles = [
        ./admin.pub
    ];

    services.openssh = {
        enable = true;
        ports = [ 22 ];
        settings.PermitRootLogin = "no";
        settings.PasswordAuthentication = false;
        settings.KbdInteractiveAuthentication = false;
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

    programs.ssh.startAgent = true;
    programs.bash.enableCompletions = true;

    users.extraUsers.admin = {
        createHome = false;
        extraGroups = [ "wheel" "audio" "video" "docker" ];
        useDefaultShell = true;
    };

    environment.systemPackages = with pkgs; [
        git
        nvim
    ];
}
