{ cabal, dataDefaultClass, Diff, filepath, HUnit, mtl, parsec
, QuickCheck, testFramework, testFrameworkHunit
, testFrameworkQuickcheck2, uniplate
}:

cabal.mkDerivation (self: {
  pname = "language-ecmascript";
  version = "0.15.1";
  sha256 = "077w8027hwjn6yrmlv2nls0fdfs6nyi4b44giw7cn206f2agx03j";
  buildDepends = [
    dataDefaultClass Diff mtl parsec QuickCheck uniplate
  ];
  doCheck = false;
  testDepends = [
    dataDefaultClass Diff filepath HUnit mtl parsec QuickCheck
    testFramework testFrameworkHunit testFrameworkQuickcheck2
  ];
  meta = {
    homepage = "http://github.com/jswebtools/language-ecmascript";
    description = "JavaScript parser and pretty-printer library";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
