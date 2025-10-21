{ config, pkgs, lib, ... }:

let
  emacsRepo = pkgs.fetchgit {
    url = "https://github.com/hangocdinhnew/emacs-config";
    rev = "a78e6c06ead316a4257b6b59d210cb4b2fd05a39";
    sha256 = "16b10id8i06c20zi875h2kg0lnlcbs7b58lah6shqfb3wflgyd5a";
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
