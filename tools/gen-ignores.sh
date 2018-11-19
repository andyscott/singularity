#!/bin/sh -e
cd "$(dirname "$0")"/..

PACKAGES0=$(find -L repos -iname BUILD.bazel | xargs -n1 dirname | tr '\n' ,)

echo Updating tools/deleted_packages.rc
echo '# generated' > tools/deleted_packages.rc
packages=$PACKAGES0
(
    echo "build --deleted_packages=$packages"
    echo "query --deleted_packages=$packages"
    echo "test  --deleted_packages=$packages"
) >> tools/deleted_packages.rc
