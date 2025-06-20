{ config, pkgs, lib, ... }:

let
  # Clone the repository using fetchGit
  weztermRepo = pkgs.fetchgit {
    url = "https://github.com/hangocdinhnew/wezterm-config.git";
    rev = "be440032c716e8a46155de9306f65f96ffa037e7";
    sha256 = "18mn2hj5pfc9kc1y38d54hj9l22dskyfvgs8km644drc4ssfsbbw";
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
