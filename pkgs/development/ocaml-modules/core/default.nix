{stdenv, buildOcaml, fetchurl, type_conv,
 core_kernel, bin_prot, comparelib, custom_printf, enumerate,
 fieldslib, herelib, pa_bench, pa_test, pa_structural_sexp, pa_ounit,
 pipebang, sexplib, typerep, variantslib}:

buildOcaml rec {
  name = "core";
  version = "113.00.00";

  minimumSupportedOcamlVersion = "4.02";

  src = fetchurl {
    url = "https://github.com/janestreet/core/archive/${version}.tar.gz";
    sha256 = "1wxp461av6fj85yvsnripjdinspkjhcybdrnpnrg7vn76y198vsx";
  };

  hasSharedObjects = true;

  buildInputs = [ pa_bench pa_test pa_structural_sexp pa_ounit ];
  propagatedBuildInputs = [ type_conv core_kernel bin_prot comparelib
                            custom_printf enumerate fieldslib herelib
                            pipebang sexplib typerep variantslib ];

  meta = with stdenv.lib; {
    homepage = https://github.com/janestreet/core;
    description = "Jane Street Capital's standard library overlay";
    license = licenses.asl20;
    maintainers = [ maintainers.ericbmerritt ];
  };
}
