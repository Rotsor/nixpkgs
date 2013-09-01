{ cabal, aeson, attoparsec, Cabal, cpphs, dataDefault, filepath
, ghcPaths, haskeline, haskellSrcExts, HUnit, languageEcmascript
, mtl, optparseApplicative, prettyShow, safe, split, syb
, testFramework, testFrameworkHunit, testFrameworkTh, text, time
, unorderedContainers, utf8String, vector
, fetchgit
}:

cabal.mkDerivation (self: {
  pname = "fay";
  version = "0.17.0.0";
  src = fetchgit {
    url = "https://github.com/faylang/fay.git";
    rev = "3abf3d0ed931cdc27c31f3328045b6cd2dc828f6";
    sha256 = "0y0p9597vc2r69j3x4dvfz0l0kagsiypl4cxzh8zy0n7y1nqr85l";
  };
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    aeson attoparsec Cabal cpphs dataDefault filepath ghcPaths
    haskeline haskellSrcExts HUnit languageEcmascript mtl
    optparseApplicative prettyShow safe split syb testFramework
    testFrameworkHunit testFrameworkTh text time unorderedContainers
    utf8String vector
  ];
  meta = {
    homepage = "http://fay-lang.org/";
    description = "A compiler for Fay, a Haskell subset that compiles to JavaScript";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
