{ stdenv, fetchFromGitHub, git, ldc }:
stdenv.mkDerivation rec {
  pname = "adrdox";
  version = "2.4.0";

  src = fetchFromGitHub rec {
    owner = "adamdruppe";
    repo = "adrdox";
    #rev = "v${version}";
    rev = "769762b";
    sha256 = "03dn46bxl3x67cmmgv7nzy95qqrf949dxw5f0vph62dfmwza7vp4";
  };

  buildInputs = [
    ldc
  ];

  makeFlags = ["ldc"];

  installPhase = ''
    install -d $out/bin $out/share/adrdox/katex
    install -m 755 -s adrdox.main $out/bin/adrdox
    install -m 644 *.js *.css *.html $out/share/adrdox
    install -m 644 katex/* $out/share/adrdox/katex
  '';
}
