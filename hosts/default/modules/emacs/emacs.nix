{ config, pkgs, lib, ... }:

let
  # Clone the repository using fetchGit
  emacsRepo = pkgs.fetchgit {
    url = "https://github.com/hangocdinhnew/emacs-config";
    rev = "a8bdfc282ec8243c1c8eb83e2c25c5dbd358b674";
    sha256 = "lygkcY4jLw07yykHySWOwjptJyMm6xSk5IJUjtoHbZA=";
  };
  
in
{

  home.activation = {
      copyEmacsRepo = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run rm -rf ${config.home.homeDirectory}/.emacs
      run rm -rf ${config.home.homeDirectory}/.emacs.rc
      run rm -rf ${config.home.homeDirectory}/.emacs.custom.el

      run mkdir ${config.home.homeDirectory}/.emacs.rc

      run cp -rf ${emacsRepo}/.emacs.rc/* ${config.home.homeDirectory}/.emacs.rc/
      run cp -rf ${emacsRepo}/.emacs ${config.home.homeDirectory}/.emacs
      run cp -rf ${emacsRepo}/.emacs.custom.el ${config.home.homeDirectory}/.emacs.custom.el

      run chmod -R u+rw ${config.home.homeDirectory}/.emacs
      run chmod -R u+rw ${config.home.homeDirectory}/.emacs.rc
      run chmod -R u+rw ${config.home.homeDirectory}/.emacs.custom.el
    '';
  };
}
