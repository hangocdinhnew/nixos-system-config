{ config, pkgs, lib, ... }:

let
  # Clone the repository using fetchGit
  hyprlandRepo = pkgs.fetchgit {
    url = "https://github.com/hangocdinhnew/hyprland-config.git";
    rev = "f451d37378eaea36af1fdf393bca71b53d478b32";
    sha256 = "1f5nkn21s60f8j5v7kl2n77mxxar0apf1qj2qcycf5fq53xja64d";
  };
  
in
{

  home.activation = {
      copyhyprlandRepo = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run rm -rf ${config.home.homeDirectory}/.config/hyprland
      run mkdir ${config.home.homeDirectory}/.config/hyprland

      run cp -rf ${hyprlandRepo}/* ${config.home.homeDirectory}/.config/hyprland/

      run chmod -R u+rw ${config.home.homeDirectory}/.config/hyprland/
    '';
  };
}
