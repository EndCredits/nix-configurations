{ config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        yzhang.markdown-all-in-one
      	ms-vscode.cpptools
      	golang.go
      	pkief.material-icon-theme
      	zhuangtongfa.material-theme
        ms-azuretools.vscode-docker
        vscode-extensions.bbenoist.nix
        vscode-extensions.arrterian.nix-env-selector
        vscode-extensions.jnoortheen.nix-ide
      ];
    })
  ];
}
