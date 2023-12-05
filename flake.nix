{
  description = "A simple script";

  outputs = { self, nixpkgs }: {
    defaultPackage.aarch64-darwin = self.packages.aarch64-darwin.my-script;

    packages.aarch64-darwin.my-script =
      let
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
      in
      pkgs.writeShellScriptBin "my-script" ''
        DATE=$(ddate +'the %e of %B, %Y')
        cowsay Hello, World! Today is $DATE.
      '';
  };
}
