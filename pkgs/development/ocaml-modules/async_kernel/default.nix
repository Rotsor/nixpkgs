{stdenv, buildOcaml, fetchurl, core_kernel,
 bin_prot, fieldslib, pa_ounit, pa_test, pa_structural_sexp,
 sexplib, herelib}:

buildOcaml rec {
  name = "async_kernel";
  version = "113.00.00";

  minimumSupportedOcamlVersion = "4.02";

  src = fetchurl {
    url = "https://github.com/janestreet/async_kernel/archive/${version}.tar.gz";
    sha256 = "1675prwz922ynkkkipgbhahpcf7n68x5l23a28mc5w0z8rxm0071";
  };

  buildInputs = [ pa_test pa_structural_sexp pa_ounit ];
  propagatedBuildInputs = [ core_kernel bin_prot fieldslib herelib sexplib ];

  meta = with stdenv.lib; {
    homepage = https://github.com/janestreet/async_kernel;
    description = "Jane Street Capital's asynchronous execution library (core) ";
    license = licenses.asl20;
    maintainers = [ maintainers.ericbmerritt ];
  };
}
