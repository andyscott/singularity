#!/bin/sh -e
bazel query --noimplicit_deps 'kind(scala_.*, deps(//repos:all))' --output graph
