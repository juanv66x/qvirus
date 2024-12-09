% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.InteractionClassification.R
\name{plot.InteractionClassification}
\alias{plot.InteractionClassification}
\title{Plot InteractionClassification Clusters}
\usage{
\method{plot}{InteractionClassification}(
  x,
  plot_clusters = TRUE,
  evaluate_clusters = FALSE,
  max_clusters = 10,
  n_clusters = 4,
  ...
)
}
\arguments{
\item{x}{An object of class \code{InteractionClassification} created using the
\code{InteractionClassification()} function. It contains the clustering results and cluster centers.}

\item{plot_clusters}{Logical. If TRUE, plots the cluster visualization. Default is TRUE.}

\item{evaluate_clusters}{Logical. If TRUE, plots the WSS to evaluate the optimal number of clusters.
Default is FALSE.}

\item{max_clusters}{Integer. The maximum number of clusters to evaluate if \code{evaluate_clusters}
is set to TRUE. Default is 10.}

\item{n_clusters}{Integer. The number of clusters to suggest when plotting the elbow method.
It determines where the vertical line (xintercept) is drawn in the plot. Default is 4.}

\item{...}{Additional arguments (currently unused).}
}
\value{
A ggplot object that visualizes the clusters and their centers, or the WSS plot to evaluate
the optimal number of clusters.
}
\description{
This function visualizes the clusters formed by the \code{InteractionClassification} object.
It displays the viral load differences (\code{vl_diff}) and CD4 count differences (\code{cd_diff})
as points, with each point color-coded by its cluster. Cluster centers are shown as red stars.
}
\details{
Additionally, it can evaluate the optimal number of clusters using the elbow method by plotting
the within-cluster sum of squares (WSS) using \code{fviz_nbclust}.
}
\examples{
data(vl_3)
data(cd_3)
interaction_obj <- create_interactions(cd_3[,-1], vl_3[,-1])
class_obj <- InteractionClassification(interaction_obj$vlogs_diff, interaction_obj$cds_diff)
plot(class_obj)
}
