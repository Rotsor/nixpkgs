{stdenv, buildOcaml, fetchurl, type_conv, pa_ounit, sexplib, herelib}:

buildOcaml rec {
  name = "pa_structural_sexp";
  version = "113.00.00";

  minimumSupportedOcamlVersion = "4.00";

  src = fetchurl {
    url = "https://github.com/janestreet/pa_structural_sexp/archive/${version}.tar.gz";
    sha256 = "1ad59z9g46mfj33xll46z79s7542fv6hb1a6naj4fz9x4drf6klh";
  };

  buildInputs = [ ];
  propagatedBuildInputs = [ type_conv sexplib herelib ];

  meta = with stdenv.lib; {
    homepage = https://github.com/janestreet/pa_structural_sexp;
    description = "Syntax that simplifies building s-expressions from ocaml values.";
    license = licenses.asl20;
    maintainers = [ maintainers.ericbmerritt ];
  };
}
