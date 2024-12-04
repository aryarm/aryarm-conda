# aryarm-conda
[<img src=https://github.com/codespaces/badge.svg width=160>](https://codespaces.new/aryarm/aryarm-conda)

Scripts, recipes, and docs for conda packages. Inspired by [jdblischak/jdb-conda](https://github.com/jdblischak/jdb-conda).

## Build a package in this repository locally

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
   channel_priority: strict
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

## Build a package in this repository in GitHub Codespaces
For your convenince, you may consider doing the steps above within [a GitHub codespace](https://codespaces.new/aryarm/aryarm-conda). This will also allow you to skip steps 1-3. You can then [download the built package](https://github.com/orgs/community/discussions/62388#discussioncomment-7281243) (located at `${CONDA_PREFIX}/conda-bld/`) from the codespace through the VSCode GUI.

## Build a package in this repository in GitHub Actions (recommended)
Alternatively, you can skip steps 1-5 by simply forking this repository. This is probably the easiest method because it uses GitHub Actions to do all the work. Any commits to the `main` branch or to a pull request will trigger a bot to automatically rebuild packages from changed recipes and publish the built packages as [Github Artifacts](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts). (You will need to enable GitHub actions for your fork first: Click the Actions tab of your fork of the repository and click "I understand my workflows, go ahead and enable them.") You can then download an artifact, unzip it, and proceed with the path to the resulting directory of files in place of the `file://${CONDA_PREFIX}/conda-bld/` path in step 6.
