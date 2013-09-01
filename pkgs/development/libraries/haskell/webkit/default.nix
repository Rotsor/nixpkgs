{ cabal, cairo, glib, gtk, gtk2hsBuildtools, pango, libsoup-native, webkit-native }:

cabal.mkDerivation (self: {
  pname = "webkit";
  version = "0.12.4";
  sha256 = "1kwjwi99pqdkhyj6csr4s6c6avika9k3nbhwv4z5rvhvhk6ghhvh";
  buildDepends = [ cairo glib gtk pango ];
  buildTools = [ gtk2hsBuildtools ];
  pkgconfigDepends = [ libsoup-native webkit-native ];
  jailbreak = true;
  meta = {
    homepage = "http://projects.haskell.org/gtk2hs/";
    description = "Binding to the Webkit library";
    license = self.stdenv.lib.licenses.lgpl21;
    platforms = self.ghc.meta.platforms;
  };
})
