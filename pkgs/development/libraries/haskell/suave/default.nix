{ cabal, blazeHtml, blazeMarkup, dataDefault, fay, gtk, mtl, scotty
, text, webkit, xmonad, xmonadContrib
, fetchgit
}:

cabal.mkDerivation (self: {
  pname = "suave";
  version = "1.0.0";
  src = fetchgit {
    url = "https://github.com/chrisdone/suave.git";
    rev = "5daa006a6973abb458dedac153ea6e1a6f2434d9";
    sha256 = "1qnjl6l8dayvmqk690i3wkc8lpbs7kcy8yy7aysjyx4mmn8p0q22";
  };
  jailbreak = true;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    blazeHtml blazeMarkup dataDefault fay gtk mtl scotty text webkit
    xmonad xmonadContrib
  ];
  meta = {
    description = "A suave desktop panel";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
