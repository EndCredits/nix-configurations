{ config, lib, ... }:

(self: super: {
	vscode = super.vscode.override {
		commandLineArgs = [
		        "--enable-features=UseOzonePlatform,WaylandWindowDecorations"
			"--ozone-platform=wayland"
			"--ozone-platform-hint=auto"
			"--enable-wayland-ime"
		];
	};
})
