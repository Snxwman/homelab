{ config, pkgs, lib, ... }:
{
    boot.kernelPackages = [
        pkgs.linuxPackages_rpi4
    ];

    boot.kernelParams = [
        "console=ttyS1,115200n8"
    ];

    boot.initrd.kernelModules = [
        "vc4"
        "bcm2835_dma"
        "i2c_bcm2835"
    ];
}
