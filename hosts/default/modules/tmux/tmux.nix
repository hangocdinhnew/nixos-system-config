{ config, pkgs, ... }:

let
  tmuxConfig = pkgs.fetchgit {
    url = "https://github.com/hangocdinhnew/.tmux";
    rev = "dc34e56e175917f0f929bfd53122fc63d50b5af9";
    sha256 = "eDzZZGjaEJLusgSTUOeV8mh0BTi/jNElELBXs4ryiyc=";
  };
in {
  # Home-manager configuration
  home.file.".tmux.conf" = {
    source = "${tmuxConfig}/.tmux.conf";
  };

  home.file.".tmux.conf.local" = {
    source = "${tmuxConfig}/.tmux.conf.local";
  };
}
