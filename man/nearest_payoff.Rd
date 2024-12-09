% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nearest_payoff.R
\name{nearest_payoff}
\alias{nearest_payoff}
\title{Find Nearest Payoff}
\usage{
nearest_payoff(vl_diff, payoffs_list)
}
\arguments{
\item{vl_diff}{Numeric value representing the viral load difference for which the
nearest payoff will be found.}

\item{payoffs_list}{A named list of payoff values, where the names correspond to
specific payoffs and the values are the associated payoff values.}
}
\value{
A list with two elements: \code{value} (the nearest payoff value) and \code{name}
(the name of the nearest payoff).
}
\description{
This function computes the nearest simulated payoff from a given list of payoffs
based on a viral load difference (vl_diff). It returns both the nearest payoff value
and its corresponding payoff name.
}
\examples{
# Load data
library(dplyr)
library(qsimulatR)
data(vl_3)
data(cd_3)

# Create interaction object and classification
interaction_obj <- create_interactions(cd_3[,-1], vl_3[,-1])
class_obj <- InteractionClassification(interaction_obj$vlogs_diff, interaction_obj$cds_diff)

# Define gates and parameters for payoffs
gates <- list(
  T = Tgate(2),
  X = X(2),
  Id = Id(2),
  H = H(2),
  Z = Z(2),
  S = S(2),
  Y = Y(2)
)
alpha <- -0.4518303; beta <- -1.654192; gamma <- -0.2638399; theta <- -0.5619246
alpha2 <- -0.04186888; beta2 <- -3.01931; gamma2 <- 0.3922753; theta2 <-1.055114

# Generate the payoffs list
payoffs_list <- payoffs_list(gates, alpha, beta, gamma, theta, alpha2, beta2, gamma2, theta2)

# Filtered data based on specific patient IDs
filtered_data <- class_obj$data |> 
  bind_cols(id = cd_3$ID) |> 
  relocate(id) |> 
  filter(id \%in\% c(37, 102, 148, 174, 180, 205))

# Apply the nearest_payoff function to each vl_diff in the filtered data
filtered_data <- filtered_data |>
  rowwise() |>
  mutate(nearest = list(nearest_payoff(vl_diff, payoffs_list))) |>
  mutate(nearest_payoff = nearest$value,
         payoff_name = nearest$name) |>
  select(-nearest) # Remove the intermediate column

# Display the updated filtered data with nearest payoff and its name
print(filtered_data)
}
