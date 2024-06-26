% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/six_state.R
\name{six_state}
\alias{six_state}
\title{Create Six Important States on the Bloch Sphere}
\usage{
six_state(vec_num = c(1, 2, 3, 4, 5, 6))
}
\arguments{
\item{vec_num}{A numeric vector specifying the indices of the states to include. Valid indices are 1 to 6.}
}
\value{
A list containing the selected quantum states based on the input vector vec_num.
}
\description{
This function creates and returns six important states on the Bloch Sphere based on the specified vector numbers.
}
\examples{
library(qsimulatR)
# Select and return states 1, 3, and 5
six_state(c(1, 3, 5))
}
