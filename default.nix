self: super: rec {
  dcd = super.callPackage ./dcd.nix {};
  ldc = super.callPackage ./ldc {};
  adrdox = super.callPackage ./adrdox.nix {};
  gcc-arm-embedded = super.callPackage ./gcc-arm-embedded {};
}
