#' Plot InteractionClassification Clusters
#'
#' This function visualizes the clusters formed by the \code{InteractionClassification} object. 
#' It displays the viral load differences (\code{vl_diff}) and CD4 count differences (\code{cd_diff}) 
#' as points, with each point color-coded by its cluster. Cluster centers are shown as red stars.
#'
#' @param x An object of class \code{InteractionClassification} created using the 
#'   \code{InteractionClassification()} function. It contains the clustering results and cluster centers.
#' @param ... Additional arguments (currently unused).
#'
#' @return A ggplot object that visualizes the clusters and their centers.
#' @export
#'
#' @examples
#' data(vl_3)
#' data(cd_3)
#' interaction_obj <- create_interactions(cd_3[,-1], vl_3[,-1])
#' class_obj <- InteractionClassification(interaction_obj$vlogs_diff, interaction_obj$cds_diff)
#' plot(class_obj)
plot.InteractionClassification <- function(x, ...) {
  
  # Extract the classification result and cluster centers
  classification_result <- x$data
  centers <- x$centers
  
  # Plot clusters using fviz_cluster from factoextra
  factoextra::fviz_cluster(
    list(data = classification_result[, c("vl_diff", "cd_diff")], cluster = classification_result$classification),
    geom = "point",
    ggtheme = ggplot2::theme_minimal(),
    show.clust.cent = TRUE,  # Display cluster centers
    main = "Interaction Classification Clusters") +
    
    ggplot2::geom_point(data = as.data.frame(centers), ggplot2::aes(x = vl_diff, y = cd_diff), color = "red", size = 3, shape = 8)
}

utils::globalVariables(c("cd_diff", "vl_diff"))