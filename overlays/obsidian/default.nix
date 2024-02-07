{ config, lib, ...}:

(self: super: {
  obsidian = super.obsidian.overrideAttrs (oldAttrs: {
    buildInputs = oldAttrs.buildInputs or [] ++ [ super.makeWrapper super.libGL ];
    postInstall = oldAttrs.postInstall or "" + ''
      sed -i "1 aexport\ LD\_LIBRARY\_PATH\=${lib.makeLibraryPath [ super.libGL ]}\/\:\$LD\_LIBRARY\_PATH" $out/bin/obsidian
      sed -i "s/\"\$\@\"/\"\-\-ozone\-platform\=wayland\"\ \"\-\-ozone\-platform\-hint\=auto\"\ \"\-\-enable\-wayland\-ime\"\ \"\$\@\"/g" $out/bin/obsidian
      '';
  });
})
