{
	system.stateVersion = "24.05";
	wsl.enable = true;

	wsl.defaultUser = "katie";

	# With this on Windows PATH is added to WSL, which slows down anything
	# that searches through it by orders of magnitude
	wsl.interop.includePath = false;
}
