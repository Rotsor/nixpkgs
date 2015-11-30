{stdenv, buildOcaml, fetchurl, async_kernel,
 async_unix, async_extra, async_rpc_kernel, pa_ounit}:

buildOcaml rec {
  name = "async";
  version = "113.00.00";

  minimumSupportedOcamlVersion = "4.02";

  src = fetchurl {
    url = "https://github.com/janestreet/async/archive/${version}.tar.gz";
    sha256 = "141wpcsjqx4281nqqd1422vp6g6d5g53q139w3fg1ypqpypa7bf8";
  };

  buildInputs = [ async_extra ];
  propagatedBuildInputs = [ async_kernel async_rpc_kernel async_unix async_extra pa_ounit ];

  meta = with stdenv.lib; {
    homepage = https://github.com/janestreet/async;
    description = "Jane Street Capital's asynchronous execution library";
    license = licenses.asl20;
    maintainers = [ maintainers.ericbmerritt ];
  };
}
