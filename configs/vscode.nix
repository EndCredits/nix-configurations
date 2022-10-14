{ config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        ms-python.python
	vscodevim.vim
	yzhang.markdown-all-in-one
	ms-vscode.cpptools
	golang.go
	pkief.material-icon-theme
	zhuangtongfa.material-theme
        ms-azuretools.vscode-docker
      ];
    })
  ];
}
