{ config, lib, ...}:

(self: super: {
  obsidian = super.obsidian.overrideAttrs (oldAttrs: {
    buildInputs = oldAttrs.buildInputs or [] ++ [ super.makeWrapper ];
    postInstall = oldAttrs.postInstall or "" + ''
      sed -i "s/\"\$\@\"/\"\-\-ozone\-platform\=wayland\"\ \"\-\-ozone\-platform\-hint\=auto\"\ \"\-\-enable\-wayland\-ime\"\ \"\$\@\"/g" $out/bin/obsidian
      '';
  });
})
