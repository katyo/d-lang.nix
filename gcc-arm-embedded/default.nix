{ stdenv
, fetchurl
, ncurses5
, python27
}:

stdenv.mkDerivation rec {
  pname = "gcc-arm-embedded";
  version = "10-2021-q1-update";
  subdir = "10-2020-q4";

  suffix = {
    aarch64-linux = "aarch64-linux";
    x86_64-darwin = "mac";
    x86_64-linux  = "x86_64-linux";
  }.${stdenv.hostPlatform.system} or (throw "Unsupported system: ${stdenv.hostPlatform.system}");

  #src = ./gcc-arm-none-eabi-9-2020-q4-major-x86_64-linux.tar.bz2;
  src = fetchurl {
    url = "https://github.com/katyo/d-lang.nix/releases/download/${pname}-${subdir}/gcc-arm-none-eabi-${version}-${suffix}.tar.bz2";
    sha256 = {
      x86_64-linux = "166yr6vjl4p0ncyzhb7s900h4j6ix020akvzi4h9fvg3zqsjnfkb";
    }.${stdenv.hostPlatform.system} or (throw "Unsupported system: ${stdenv.hostPlatform.system}");
  };

  phases = [ "unpackPhase" "installPhase" "fixupPhase" ];

  installPhase = ''
    mkdir -p $out
    cp -r * $out
    ln -s $out/share/doc/gcc-arm-none-eabi/man $out/man
  '';

  dontPatchELF = true;
  dontStrip = true;

  preFixup = ''
    find $out -type f | while read f; do
      patchelf $f > /dev/null 2>&1 || continue
      patchelf --set-interpreter $(cat ${stdenv.cc}/nix-support/dynamic-linker) "$f" || true
      patchelf --set-rpath ${stdenv.lib.makeLibraryPath [ "$out" stdenv.cc.cc ncurses5 python27 ]} "$f" || true
    done
  '';

  meta = with stdenv.lib; {
    description = "Pre-built GNU toolchain from ARM Cortex-M & Cortex-R processors";
    homepage = "https://developer.arm.com/open-source/gnu-toolchain/gnu-rm";
    license = with licenses; [ bsd2 gpl2 gpl3 lgpl21 lgpl3 mit ];
    maintainers = with maintainers; [ prusnak ];
    platforms = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" ];
  };
}
