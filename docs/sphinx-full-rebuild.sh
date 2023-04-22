#! /bin/bash

echo Rebuilding source directory
find ./source -mindepth 1 -delete 2>/dev/null
rmdir ./source
sphinx-apidoc -f --maxdepth 4 --separate --doc-project "configurable_argparse" --doc-author "DavidRodriguezSoaresCUI" --full -o source ../src/configurable_argparse
python3 sphinx-patch-conf.py

echo Rebuilding HTML build
find ./build -mindepth 1 -delete 2>/dev/null
rmdir ./build
sphinx-build source build
echo Done ! Open build/index.html to see documentation