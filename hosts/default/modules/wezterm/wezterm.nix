{ config, pkgs, lib, ... }:

let
  # Clone the repository using fetchGit
  weztermRepo = pkgs.fetchgit {
    url = "https://github.com/hangocdinhnew/wezterm-config.git";
    rev = "3707d532f1ca324b656fcb1958e82e07f6870899";
    sha256 = "1h9rdcxjqa1chsbp1svw0vzyj00imqbxb424hmg3x0rbj8jphrck";
  };
  
in
{

  home.activation = {
      copyweztermRepo = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run rm -rf ${config.home.homeDirectory}/.config/wezterm
      run mkdir ${config.home.homeDirectory}/.config/wezterm

      run cp -rf ${weztermRepo}/* ${config.home.homeDirectory}/.config/wezterm/

      run chmod -R u+rw ${config.home.homeDirectory}/.config/wezterm/
    '';
  };
}
