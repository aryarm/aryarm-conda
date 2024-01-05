# aryarm-conda
[<img src=https://github.com/codespaces/badge.svg width=160>](https://codespaces.new/aryarm/aryarm-conda)

Scripts, recipes, and docs for conda packages. Inspired by [jdblischak/jdb-conda](https://github.com/jdblischak/jdb-conda).

To build a local version of a package in this repository:

1. Clone this repository
    ```
    git clone https://github.com/aryarm/aryarm-conda.git
    cd aryarm-conda
    ```
2. Verify that your `~/.condarc` file contains the following:
   ```
   channels:
     - conda-forge
     - bioconda
     - nodefaults
   ```
   ```
   vim ~/.condarc
   ```
3. Install bioconda-utils in a new environment
    ```
    conda create -y -n biobuild bioconda-utils
    conda activate biobuild
    ```
4. Build the package
    ```
    bioconda-utils build --packages PACKAGE
    ```
5. Install the package in a new environment
    ```
    conda create -y -n PACKAGE -c file://${CONDA_PREFIX}/conda-bld/ PACKAGE
    ```
6. Activate the new environment
    ```
    conda activate PACKAGE
    ```
