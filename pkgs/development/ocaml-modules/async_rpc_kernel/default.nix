{stdenv, buildOcaml, fetchurl, core_kernel, async_kernel,
 bin_prot, fieldslib, pa_ounit, pa_test, pa_structural_sexp,
 sexplib, herelib}:

buildOcaml rec {
  name = "async_rpc_kernel";
  version = "113.00.00";

  minimumSupportedOcamlVersion = "4.02";

  src = fetchurl {
    url = "https://github.com/janestreet/async_rpc_kernel/archive/${version}.tar.gz";
    sha256 = "0ggpkb6x751yqhwql0ya1x4rz753m449q0f25b1465961n1vrj11";
  };

  buildInputs = [ pa_test pa_ounit sexplib ];
  propagatedBuildInputs = [ core_kernel async_kernel bin_prot herelib fieldslib ];

  meta = with stdenv.lib; {
    homepage = https://github.com/janestreet/async_rpc_kernel;
    description = "Jane Street Capital's asynchronous execution library (core) ";
    license = licenses.asl20;
    maintainers = [ maintainers.ericbmerritt ];
  };
}
