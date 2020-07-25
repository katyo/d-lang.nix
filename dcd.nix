{ stdenv, fetchgit, git, ldc, ... }:
stdenv.mkDerivation rec {
  pname = "dcd";
  version = "0.13.0";

  src = fetchgit rec {
    url = "https://github.com/dlang-community/DCD";
    rev = "v${version}";
    sha256 = "1grfkkk3q7dld6n3xxxmg5rv679dp235i1qwymzbdj0993bv7i57";
    fetchSubmodules = true;
    leaveDotGit = true;
    deepClone = true;
  };

  buildInputs = [
    git
    ldc
  ];

  makeFlags = ["ldc"];

  installPhase = ''
    install -d $out/bin
    install -m 755 bin/dcd-client $out/bin/dcd-client
    install -m 755 bin/dcd-server $out/bin/dcd-server
  '';
}
