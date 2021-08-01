let 
 secrets = import ../../secrets.nix;
in {
# Use the systemd-boot EFI boot loader.
  boot = {
    cleanTmpDir = true;
    loader = {
      systemd-boot = {
        enable = true;
        signed = true;
        signing-key = secrets.secure-boot.key;
        signing-certificate = secrets.secure-boot.cert;
        configurationLimit = 4;
      };
      efi.canTouchEfiVariables = true;
    };
    #supportedFilesystems = [ "ntfs" ];
  };
}
