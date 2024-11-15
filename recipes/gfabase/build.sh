#!/bin/bash -euo

set -xe

sed 's/{{GIT_SEMVER}}/'"$PKG_VERSION"'/' Cargo.toml.in > Cargo.toml
cargo install --no-track --locked --verbose --root "${PREFIX}" --path .
