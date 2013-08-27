{ cabal, diagramsCairo, gtk, diagramsLib
}:

cabal.mkDerivation (self: {
  pname = "diagrams-gtk";
  version = "0.6.0.1";
  sha256 = "1ym3qj22prv0skir9103c0aj5lhalfb6f1vavvj5mrhr1d28mkcb";
  buildDepends = [
    gtk diagramsCairo diagramsLib
  ];
  meta = {
    homepage = "http://projects.haskell.org/diagrams";
    description = "Cairo backend for diagrams drawing EDSL";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
