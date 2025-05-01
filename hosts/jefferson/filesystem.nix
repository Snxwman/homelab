{ config, pkgs, ... }:
{
    services.udev.extraRules = ''
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md0_hdd0"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md0_hdd1"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md0_hdd2"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md0_hdd3"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md0_hdd4"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md0_hdd5"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md0_hdd6"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md0_hdd7"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md0_hdd8"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md0_hdd9"

        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md1_ssd0"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md1_ssd1"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md1_ssd2"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="", SYMLINK+="md1_ssd3"

        SUBSYSTEM=="block", ENV{ID_SERIAL}=="CT4000MX500SSD1_2307E6AE2D06", SYMLINK+="md2_ssd0"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="CT4000MX500SSD1_2336E873A4E0", SYMLINK+="md2_ssd1"

        SUBSYSTEM=="block", ENV{ID_SERIAL}=="WDC_WDS100T2G0A-00JH30_204156800043", SYMLINK+="md3_ssd0"
        SUBSYSTEM=="block", ENV{ID_SERIAL}=="WDC_WDS100T2G0A-00JH30_204156801079", SYMLINK+="md3_ssd1"

        SUBSYSTEM=="block", ENV{ID_SERIAL}=="Samsung_SSD_980_1TB_S64ANG0R327520L", SYMLINK+="nvme"
    '';

    # fileSystem."/mnt/md0" = {};
    # fileSystem."/mnt/md1" = {};
    # fileSystem."/mnt/md2" = {};
    # fileSystem."/mnt/md3" = {};
}
