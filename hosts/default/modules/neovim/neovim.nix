{ config, pkgs, lib, ... }:

let
  # Clone the repository using fetchGit
  nvimRepo = pkgs.fetchgit {
    url = "https://github.com/hangocdinhnew/nvim-dotfiles.git";
    rev = "53fdf0dd74d8f76aef02542673eb65b816624229";
    sha256 = "KYwaYr6jW/Pw4+OghQrUchTD5neMkPJ2Ar/q8vXB8+s=";
  };
  
in
{

  home.activation = {
      copyNeovimRepo = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run rm -rf ${config.home.homeDirectory}/.config/nvim
      run mkdir ${config.home.homeDirectory}/.config/nvim

      # Copy the entire nvimRepo directory to ~/.config/nvim
      run cp -rf ${nvimRepo}/* ${config.home.homeDirectory}/.config/nvim/

      # Ensure the copied files are readable and writable by the user
      run chmod -R u+rw ${config.home.homeDirectory}/.config/nvim/
    '';
  };
}
