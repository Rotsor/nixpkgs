{ stdenv, fetchurl, zlib, curl, automake, libtool, autoconf, unzip }:

stdenv.mkDerivation rec {
  name = "funambol-client-cpp-9.0.0";

  src = fetchurl {
    url = mirror://sourceforge/funambol/funambol-client-sdk-9.0.0.zip;
    sha256 = "1667gahz30i5r8kbv7w415z0hbgm6f6pln1137l5skapi1if6r73";
  };

  postUnpack = ''sourceRoot+="/sdk/cpp/build/autotools"'';

  # Upstream guys forgotten to run autoreconf...
  preConfigure=''
    libtoolize -c -f
    aclocal
    autoheader
    automake -a -c -f --add-missing
    autoconf -f'';

  propagatedBuildInputs = [ zlib curl ];

  buildNativeInputs = [ automake libtool autoconf unzip ];

  meta = {
    description = "SyncML client sdk by Funambol project";
    homepage = http://www.funambol.com;
    maintainers = [ stdenv.lib.maintainers.urkud ];
  };
}
