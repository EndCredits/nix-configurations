{ config, lib, ... }:

(self: super: {
	google-chrome = super.google-chrome.override {
		commandLineArgs = [
			"--ozone-platform=wayland"
			"--ozone-platform-hint=auto"
			"--enable-wayland-ime"
		];
	};
})
