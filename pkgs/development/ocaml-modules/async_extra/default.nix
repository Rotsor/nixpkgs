{stdenv, buildOcaml, fetchurl, async_kernel, async_unix, async_rpc_kernel,
 bin_prot, core, custom_printf, fieldslib, herelib, pa_ounit,
 pipebang, pa_test, pa_structural_sexp, sexplib}:

buildOcaml rec {
  name = "async_extra";
  version = "113.00.00";

  minimumSupportedOcamlVersion = "4.02";

  src = fetchurl {
    url = "https://github.com/janestreet/async_extra/archive/${version}.tar.gz";
    sha256 = "1ad1hdzl775adxs5n6p9x1k5p8r6xd8g5vbqsfipjpks3x4igg1x";
  };

  buildInputs = [ pa_test pa_structural_sexp pa_ounit ];
  propagatedBuildInputs = [ async_kernel async_unix async_rpc_kernel core bin_prot custom_printf
                            fieldslib herelib pipebang sexplib ];

  meta = with stdenv.lib; {
    homepage = https://github.com/janestreet/async_extra;
    description = "Jane Street Capital's asynchronous execution library (extra)";
    license = licenses.asl20;
    maintainers = [ maintainers.ericbmerritt ];
  };
}
