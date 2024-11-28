{ config, pkgs, ... }:

{
  programs.kitty.enable = true;
  programs.kitty.settings = {
  	mouse_hide_wait = 2.0;
  	cursor_shape = "block";
  	url_style = "dotted";
  	confirm_os_window_close = "0";
  	background_opacity = 0.82;
	shell = "zsh";

  	foreground = "#839496";
  	background = "#001b21";
  	selection_background = "#073642";

  	cursor = "#839496";
  	cursor_text_color = "#073642";

  	url_color = "#005bbb";

  	wayland_titlebar_color = "system";
  	macos_titlebar_color = "system";

  	active_tab_foreground = "#11111B";
  	active_tab_background = "#CBA6F7";
  	inactive_tab_foreground = "#CDD6F4";
  	inactive_tab_background = "#181825";
  	tab_bar_background = "#11111B";

  	mark1_foreground = "#1E1E2E";
  	mark1_background = "#B4BEFE";
  	mark2_foreground = "#1E1E2E";
  	mark2_background = "#CBA6F7";
  	mark3_foreground = "#1E1E2E";
  	mark3_background = "#74C7EC";

  	color0 = "#073642";
  	color8 = "#002b36";

  	color1 = "#dc322f";
  	color9 = "#cb4b16";

  	color2 = "#859900";
  	color10 = "#586e75";

  	color3 = "#b58900";
  	color11 = "#657b83";

  	color4 = "#268bd2";
  	color12 = "#839496";

  	color5 = "#d33682";
  	color13 = "#6c71c4";

  	color6 = "#2aa198";
  	color14 = "#93a1a1";

  	color7 = "#eee8d5";
  	color15 = "#fdf6e3";
};
programs.kitty.font.name = "Hack Nerd Font Mono Bold";
programs.kitty.font.size = 12;
programs.kitty.shellIntegration.enableZshIntegration = true;
}
