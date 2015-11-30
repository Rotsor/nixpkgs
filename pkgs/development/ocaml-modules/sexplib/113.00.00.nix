{stdenv, buildOcaml, fetchurl, type_conv, camlp4}:

buildOcaml rec {
  minimumSupportedOcamlVersion = "4.02";
  name = "sexplib";
  version = "113.00.00";

  src = fetchurl {
    url = "https://github.com/janestreet/sexplib/archive/${version}.tar.gz";
    sha256 = "1r20hamrh1mnn89ia3k70rnbbxj05hd642mhrdb6i4z3masg34fz";
  };

  propagatedBuildInputs = [ type_conv camlp4 ];

  meta = with stdenv.lib; {
    homepage = https://ocaml.janestreet.com/;
    description = "Library for serializing OCaml values to and from S-expressions";
    license = licenses.asl20;
    maintainers = [ maintainers.ericbmerritt ];
  };
}
