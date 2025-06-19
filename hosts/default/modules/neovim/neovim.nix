{ config, pkgs, lib, ... }:

let
  # Clone the repository using fetchGit
  nvimRepo = pkgs.fetchgit {
    url = "https://github.com/hangocdinhnew/nvim-dotfiles.git";
    rev = "bb2bc5c8844cab01aaecb6dfb73f9acbc5848cdf";
    sha256 = "0q052a4wxyfz68w1qj1hlr3iww2i7lclwfmf85gc3vm9dhgwyg8n";
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
