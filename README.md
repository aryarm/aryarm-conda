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
    ```
4. Activate the new environment
    ```
    conda activate biobuild
    ```
5. Build the package
    ```
    bioconda-utils build --packages PACKAGE
    ```
6. Install the package in a new environment
    ```
    conda create -y -n PACKAGE -c file://${CONDA_PREFIX}/conda-bld/ PACKAGE
    ```
7. Activate the new environment
    ```
    conda activate PACKAGE
    ```

For maximum reproducibility, consider doing these steps within [a GitHub codespace](https://codespaces.new/aryarm/aryarm-conda). This will also allow you to skip steps 1-3.