# Import from https://github.com/wineee/nixos-config/blob/master/sys/fonts.nix
{ pkgs, ... }:

{
  fonts = {
        enableDefaultPackages = true;
        fontconfig = {
 	        enable = true;
	        defaultFonts = {
            serif = [ "LXGW Neo XiHei" "Noto Sans CJK SC" ];
	          sansSerif = [ "LXGW Neo XiHei" "Noto Sans CJK SC"];
	          emoji = [ "Noto Color Emoji" ];
            monospace = [ "CaskaydiaCove Nerd Font Mono" "Hack" "Sarasa Mono SC" ];
          };

	};
        fontDir.enable = true;
        enableGhostscriptFonts = true;
        packages = with pkgs; [
            sarasa-gothic
            lxgw-neoxihei
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            wqy_microhei
            wqy_zenhei
            symbola  # 特殊字符
            jetbrains-mono
            ubuntu_font_family
            (nerdfonts.override { fonts = [ "CodeNewRoman" "CascadiaCode" ]; })
        ];
  };
}
