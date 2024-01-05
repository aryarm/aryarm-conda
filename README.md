# aryarm-conda
Scripts, recipes, and docs for conda packages. Inspired by [jdblischak/jdb-conda](https://github.com/jdblischak/jdb-conda).

To build a local version of a package in this repository:

1. Clone this repository
    ```
    git clone https://github.com/aryarm/aryarm-conda.git
    cd aryarm-conda
    ```
2. Install bioconda-utils
    ```
    conda create -y -n biobuild -c conda-forge -c bioconda bioconda-utils
    conda activate biobuild
    ```
4. Verify that your `~/.condarc` file contains the following:
   ```
   channels:
     - conda-forge
     - bioconda
     - defaults
   ```
5. Build the package
    ```
    bioconda-utils build --packages PACKAGE
    ```
6. Install the package in a new environment
    ```
    conda create -y -n PACKAGE -c conda-forge -c bioconda -c file://${CONDA_PREFIX}/conda-bld/ PACKAGE
    ```
7. Activate the new environment
    ```
    conda activate PACKAGE
    ```
