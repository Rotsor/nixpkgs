{stdenv, fetchurl, buildOcaml}:

buildOcaml rec {
  minimumSupportedOcamlVersion = "4.02";

  name = "type_conv";
  version = "113.00.00";

  src = fetchurl {
    url = "https://github.com/janestreet/type_conv/archive/${version}.tar.gz";
    sha256 = "0hzbbz3ffflkbm69358g5p4p2845iawhfjrkiyni2i7j2v1mpgsj";
  };

  meta = {
    homepage = "https://github.com/janestreet/type_conv/";
    description = "Support library for preprocessor type conversions";
    license = stdenv.lib.licenses.asl20;
    maintainers = with stdenv.lib.maintainers; [ z77z ericbmerritt ];
  };
}
