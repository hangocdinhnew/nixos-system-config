{ config, pkgs, ... }:

let
  # Define where to clone Powerlevel10k by directly using homeDirectory
  zshCustom = "${config.home.homeDirectory}/.oh-my-zsh/custom";  # This is the standard Oh-My-Zsh path
  powerlevel10kDir = "${zshCustom}/themes/powerlevel10k";
in
{
  	home.packages = with pkgs; [
		zsh-autosuggestions
		zsh-history-substring-search
		zsh-syntax-highlighting
		zsh-powerlevel10k
  	];

  	home.file = {
  	  ".p10k.zsh" = {
  	    source = ./p10k.zsh;
  	    target = "${config.home.homeDirectory}/p10k.zsh";
  	  };
  	};

	programs.zsh = {
          enable = true;

	  autosuggestion.enable = true;	  
	  syntaxHighlighting.enable = true;

	  shellAliases = {
            "ll" = "eza -l --icons";
	    "lla" = "eza -la --icons";
	  };

    	  plugins = [
    	    {
    	      name = "powerlevel10k";
    	      src = pkgs.zsh-powerlevel10k;
    	      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    	    }
    	  ];

	  oh-my-zsh = {
	    enable = true;
	    plugins = [ "git" "history-substring-search" ];
	  };

	  initExtra = ''
	    [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
	  '';
	};
}
