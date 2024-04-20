
<!-- README.md is generated from README.Rmd. Please edit that file -->

# qvirus

<!-- badges: start -->
<!-- badges: end -->

The goal of qvirus is to provide resources, tutorials, and code snippets
dedicated to exploring the intersection of quantum computing and
artificial intelligence (AI) in the context of HIV drug design.

## Installation

You can install the development version of qvirus from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("juanv66x/qvirus")
```

## Example

This is a basic example which shows you how to solve a common problem in
quantum computing.

``` r
library(qvirus)
## basic example code
```

Applying a gate to a quantum state.

``` r
library(qsimulatR)
H(1)*six_state(1)[[1]]
#>    ( 0.7071068 ) * |0> 
#>  + ( 0.7071068 ) * |1>
```

Visualization of quantum circuit.

<img src="man/figures/README-circ-1.png" width="100%" />
