#!/bin/bash

if [[ "$(uname -m)" == "arm64" ]]; then
    # hard gfortran paths in R build(?) break the build on osx-arm64
    sed -i.bak 's|$(FLIBS)|-L$(PREFIX)/lib/gcc/arm64-apple-darwin20.0.0/13.3.0 -lgfortran -lquadmath -lm -L$(PREFIX)/lib/R/lib -lR -Wl,-framework -Wl,CoreFoundation|' src/Makevars
fi

$R CMD INSTALL --build .

pushd extdata
install "step1_fitNULLGLMM_qtl.R" "step2_tests_qtl.R" "step3_gene_pvalue_qtl.R" "makeGroupFile.R" "createSparseGRM.R" "${PREFIX}/bin"
popd
