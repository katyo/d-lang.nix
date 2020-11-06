{ stdenv, fetchFromGitHub, llvmPackages_10, ldc, dub }:
let libclang = llvmPackages_10.libclang;
in stdenv.mkDerivation rec {
  pname = "dstep";
  version = "1.0.1-gitd355dec";

  src = fetchFromGitHub {
    owner = "jacob-carlborg";
    repo = "dstep";
    #rev = "v${version}";
    rev = "d355dec";
    sha256 = "1xyxnmcdqdavm3szix026m3rwlwffhcinyabija6l5y4gg2k8cr7";
  };

  propagatedBuildInputs = [ libclang ];
  nativeBuildInputs = [ ldc dub ];

  configurePhase = ''
    ldc2 -run configure.d --llvm-path="${libclang}"
  '';

  buildPhase = ''
    dub build -b release
  '';

  installPhase = ''
    install -d $out/bin
    install -m 755 bin/dstep $out/bin
  '';
}
