{ pkgs, ... }:
{
    imports = [
        /homelab/modules/default/firewall.nix
        /homelab/modules/default/ssh.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    time.timeZone = "America/New_York";

    i18n.defaultLocale = "en_US.UTF-8";

    system.copySystemConfiguration = true;

    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        git
        neovim
        zsh
    ];

    system.autoUpgrade = {
        enable = true;
        allowReboot = false;
        dates = "weekly";
    };

    nix.settings.auto-optimise-store = true;
    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 180d";
    };

    nix.settings.expirimental-features = [
        "nix-command"
        "flakes"
    ];

    security.sudo.enable = true;
    programs.bash.completion.enable = true;

    virtualisation.oci-containers.backend = "docker";
}
