{ config, pkgs, lib, ... }:

let
  # Clone the repository using fetchGit
  rofiRepo = pkgs.fetchgit {
    url = "https://github.com/hangocdinhnew/rofi-config.git";
    rev = "5957265cee4ace89420404dce5e9bc0d08d33e2a";
    sha256 = "00hdcac26rwybcd0bz4q9b4yqs1y3an9xv36fwq70ln18nhdh8ky";
  };
  
in
{
  programs.rofi = {
    enable = true;
    plugins = [pkgs.rofi-emoji];
  };

  home.activation = {
      copyrofiRepo = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run rm -rf ${config.home.homeDirectory}/.config/rofi
      run mkdir ${config.home.homeDirectory}/.config/rofi

      run cp -rf ${rofiRepo}/* ${config.home.homeDirectory}/.config/rofi/

      run chmod -R u+rw ${config.home.homeDirectory}/.config/rofi/
    '';
  };
}
