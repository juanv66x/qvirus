% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_interactions.R
\name{create_interactions}
\alias{create_interactions}
\title{Create Interactions from CD4 and Viral Load Data}
\usage{
create_interactions(cd_data, vl_data)
}
\arguments{
\item{cd_data}{A data frame containing CD4 counts. Each row should represent an individual,
and each column should represent a different time point or measurement.}

\item{vl_data}{A data frame containing viral load measurements. It should have the same
structure as \code{cd_data}, with rows for individuals and columns for time points.}
}
\value{
A list of class "interaction" containing:
\describe{
\item{cd_diff}{A numeric vector of CD4 differences computed from the input \code{cd_data}.}
\item{cds_diff}{A numeric vector of standardized CD4 differences.}
\item{vl_diff}{A numeric vector of viral load differences computed from the input \code{vl_data}.}
\item{vlog_diff}{A numeric vector of log-transformed viral load differences.}
\item{vlogs_diff}{A numeric vector of standardized log-transformed viral load differences.}
}
}
\description{
This function computes the differences in CD4 counts and viral load from the provided datasets.
It returns standardized values and logs transformed viral loads, enabling interaction analysis
for further modeling.
}
\examples{
# Example data frames for CD4 counts and viral loads
data(cd_3)
data(vl_3)

# Create interactions
create_interactions(cd_3[, -1], vl_3[, -1])
}
