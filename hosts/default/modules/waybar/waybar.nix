{ config, pkgs, lib, ... }:

let
  # Clone the repository using fetchGit
  waybarRepo = pkgs.fetchgit {
    url = "https://github.com/hangocdinhnew/waybar-config.git";
    rev = "105b78ea5c692da489344b281842c33c961e9e99";
    sha256 = "1ja0f4crnp65395ymwhz9nj48y1rbcw9n44w7bgf853cd7kagxhy";
  };
  
in
{

  home.activation = {
      copywaybarRepo = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run rm -rf ${config.home.homeDirectory}/.config/waybar
      run mkdir ${config.home.homeDirectory}/.config/waybar

      run cp -rf ${waybarRepo}/* ${config.home.homeDirectory}/.config/waybar/

      run chmod -R u+rw ${config.home.homeDirectory}/.config/waybar/
    '';
  };
}
