#!/bin/bash

julia -e 'using Pkg; Pkg.add("Arpack")'
julia -e 'using Pkg; Pkg.add("HDF5")'
julia -e 'using Pkg; Pkg.add("ArgParse")'
julia -e 'using Pkg; Pkg.add("JLD")'
julia -e 'using Pkg; Pkg.add("JSON")'
julia -e 'using Pkg; Pkg.add("IterativeSolvers")'
julia -e 'using Pkg; Pkg.add("DelimitedFiles")'
julia -e 'using Pkg; Pkg.add("StaticArrays")'
julia -e 'using Pkg; Pkg.add("LinearMaps")'