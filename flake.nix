{
  description = "A simple script";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.my-script;

    packages.x86_64-linux.my-script =
      let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
      in
      pkgs.writeShellScriptBin "my-script" ''
        DATE=$(ddate +'the %e of %B, %Y')
        cowsay Hello, World! Today is $DATE.
      '';
  };
}
