% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pure_qubit2.R
\name{pure_qubit2}
\alias{pure_qubit2}
\title{Create a normalized pure quantum state for a 2-qubit system.}
\usage{
pure_qubit2(theta1, theta2, phi1, phi2)
}
\arguments{
\item{theta1}{The parameter theta1 in radians for the first qubit.}

\item{theta2}{The parameter theta2 in radians for the second qubit.}

\item{phi1}{The phase parameter phi1 in radians for the first qubit.}

\item{phi2}{The phase parameter phi2 in radians for the second qubit.}
}
\value{
A qstate object representing the normalized pure quantum state for a 2-qubit system.
}
\description{
Create a normalized pure quantum state for a 2-qubit system.
}
\examples{
#' 
# Quantum simulator
library(qsimulatR)
# Define the parameters
theta1 <- pi/3
theta2 <- pi/4
phi1 <- pi/6
phi2 <- pi/5

# Create the quantum state
psi_qubit2 <- pure_qubit2(theta1, theta2, phi1, phi2)
psi_qubit2
}
