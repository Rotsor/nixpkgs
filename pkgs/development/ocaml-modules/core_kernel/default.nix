{stdenv, buildOcaml, fetchurl, type_conv,
 bin_prot, comparelib, custom_printf, enumerate,
 fieldslib, herelib, pa_bench, pa_structural_sexp, pa_ounit, pa_test,
 pipebang, sexplib, typerep, variantslib}:

buildOcaml rec {
  name = "core_kernel";
  version = "113.00.00";

  minimumSupportedOcamlVersion = "4.02";

  src = fetchurl {
    url = "https://github.com/janestreet/core_kernel/archive/${version}.tar.gz";
    sha256 = "14dizq3clkrq535gjmamv241v2fpv9yk6yn31b4wxgshqis3wb80";
  };

  hasSharedObjects = true;

  buildInputs = [ pa_structural_sexp pa_ounit pa_test ];
  propagatedBuildInputs = [ type_conv pa_bench bin_prot comparelib custom_printf
                            enumerate fieldslib herelib pipebang sexplib
                            typerep variantslib ];

  meta = with stdenv.lib; {
    homepage = https://github.com/janestreet/core_kernel;
    description = "Jane Street Capital's standard library overlay (kernel)";
    license = licenses.asl20;
    maintainers = [ maintainers.ericbmerritt ];
  };
}
