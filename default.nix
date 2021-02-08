self: super: rec {
  dmd = super.callPackage ./dmd {};
  dcd = super.callPackage ./dcd.nix {};
  ldc = super.callPackage ./ldc {};
  adrdox = super.callPackage ./adrdox.nix {};
  dstep = super.callPackage ./dstep.nix { inherit ldc; };
  gcc-arm-embedded = super.callPackage ./gcc-arm-embedded {};
}
