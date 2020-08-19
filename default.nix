self: super: {
  dcd = super.callPackage ./dcd.nix {};
  ldc = super.callPackage ./ldc {};
  adrdox = super.callPackage ./adrdox.nix {};
}
