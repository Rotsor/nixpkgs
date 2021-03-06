{stdenv, fetchurl, bash, yasm, which, perl}:

stdenv.mkDerivation rec {
  name = "libvpx-1.1.0";
  
  src = fetchurl {
    url = http://webm.googlecode.com/files/libvpx-v1.1.0.tar.bz2;
    sha256 = "1ibjxcdsazqfbbjhb8w56vy3n9qwny2m9q4kzx4rmk9v9g7p9q4w";
  };

  patchPhase = ''
    sed -e 's,/bin/bash,${bash}/bin/bash,' -i configure build/make/version.sh \
      examples/gen_example_code.sh build/make/gen_asm_deps.sh
    sed -e '/enable linux/d' -i configure
  '';

  configureScript = "../configure";

  preConfigure = ''
    mkdir -p build
    cd build
  '';

  configureFlags = [
    "--disable-install-srcs"
    "--disable-examples"
    "--enable-vp8"
    "--enable-runtime-cpu-detect"
    "--enable-shared"
    "--enable-pic"
  ];

  installPhase = ''
    make quiet=false DIST_DIR=$out install
  '';

  buildInputs = [ yasm which perl ];

  meta = {
    description = "VP8 video encoder";
    homepage = http://code.google.com/p/webm;
    license = "BSD";
  };
}

