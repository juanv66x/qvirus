% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/conjugate_transpose.R
\name{conjugate_transpose}
\alias{conjugate_transpose}
\title{Calculate the Conjugate Transpose of a Quantum State}
\usage{
conjugate_transpose(state)
}
\arguments{
\item{state}{A qstate object for which the conjugate transpose is to be calculated.}
}
\value{
The conjugate transpose of the input quantum state.
}
\description{
This function calculates the conjugate transpose of a given quantum state represented by a qstate object.
}
\examples{
library(qsimulatR)
library(qvirus)
# Calculate the conjugate transpose of ket0
state <- six_state(1)[[1]]
conjugate_transpose(state)
}
