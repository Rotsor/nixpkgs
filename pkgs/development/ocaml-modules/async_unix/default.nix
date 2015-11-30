{stdenv, buildOcaml, fetchurl, async_kernel,
 bin_prot, comparelib, core, fieldslib, herelib, pa_ounit,
 pipebang, pa_test, pa_structural_sexp, sexplib}:

buildOcaml rec {
  name = "async_unix";
  version = "113.00.00";

  minimumSupportedOcamlVersion = "4.02";

  src = fetchurl {
    url = "https://github.com/janestreet/async_unix/archive/${version}.tar.gz";
    sha256 = "0m7pnpvnka6mqqh2hz7d4lv13xqhfilmj6d4krl1yjg729zf9khl";
  };

  hasSharedObjects = true;
  buildInputs = [ pa_ounit ];
  propagatedBuildInputs = [ async_kernel core bin_prot comparelib
                            fieldslib herelib pipebang pa_test pa_structural_sexp sexplib ];

   meta = with stdenv.lib; {
    homepage = https://github.com/janestreet/async_unix;
    description = "Jane Street Capital's asynchronous execution library (unix)";
    license = licenses.asl20;
    maintainers = [ maintainers.ericbmerritt ];
   };
}
