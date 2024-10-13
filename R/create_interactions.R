#' Create Interactions between longitudinal values of CD4 Lymphocytes and Viral 
#' Load Data
#'
#' This function computes the differences in CD4 counts and viral loads over time 
#' for a set of patients, standardizes the data, and returns a structured output 
#' containing the calculated differences.
#'
#' @param cd_data A data frame containing longitudinal CD4 count values for patients.
#' @param vl_data A data frame containing longitudinal viral load values for patients.
#'
#' @return A list with the following components:
#' \describe{
#'   \item{cd_diff}{A tibble containing the differences in CD4 count values for each patient.}
#'   \item{cds_diff}{A tibble containing the standardized differences in CD4 count values.}
#'   \item{vl_diff}{A tibble containing the differences in viral load values for each patient.}
#'   \item{vlog_diff}{A tibble containing the log10-transformed differences in viral load values.}
#'   \item{vlogs_diff}{A tibble containing the standardized log10-transformed differences in viral load values.}
#' }
#' 
#' @export
#'
#' @examples
#' data(cd_3)
#' data(vl_3)
#' create_interactions(cd_3, vl_3)
create_interactions <- function(cd_data, vl_data) {
  
  # Compute CD4 differences
  cd_diff <- cd_data |>
    dplyr::rowwise() |>
    dplyr::mutate(cd_diff_values = list(mean(diff(stats::na.omit(dplyr::c_across(dplyr::everything())))))) |>
    dplyr::ungroup() |>
    dplyr::select(cd_diff_values)
  
  # Standardize CD4 data
  cd_std <- cd_data |>
    dplyr::mutate(dplyr::across(dplyr::everything(), ~ scale(.) |> as.vector())) 
  cds_diff <- cd_std |>
    dplyr::rowwise() |>
    dplyr::mutate(cd_std_diff_values = list(mean(diff(stats::na.omit(dplyr::c_across(dplyr::everything())))))) |>
    dplyr::ungroup() |>
    dplyr::select(cd_std_diff_values)
  
  # Compute Viral Load differences
  vl_diff <- vl_data |>
    dplyr::rowwise() |>
    dplyr::mutate(vl_diff_values = list(mean(diff(stats::na.omit(dplyr::c_across(dplyr::everything())))))) |>
    dplyr::ungroup() |>
    dplyr::select(vl_diff_values)
  
  # Log transform for viral load data
  vl_log <- vl_data |>
    dplyr::transmute(dplyr::across(dplyr::everything(), ~ ifelse(. == 0, 0, log10(.)), .names = "log_{col}"))
  vlog_diff <- vl_log |>
    dplyr::rowwise() |>
    dplyr::mutate(vlog_diff_values = list(mean(diff(stats::na.omit(dplyr::c_across(dplyr::everything())))))) |>
    dplyr::ungroup() |>
    dplyr::select(vlog_diff_values)
  
  # Standardize log-transformed viral load data
  vlog_std <- vl_log |>
    dplyr::mutate(dplyr::across(dplyr::everything(), ~ scale(.) |> as.vector())) 
  vlogs_diff <- vlog_std |>
    dplyr::rowwise() |>
    dplyr::mutate(vlogs_std_diff_values = list(mean(diff(stats::na.omit(dplyr::c_across(dplyr::everything())))))) |>
    dplyr::ungroup() |>
    dplyr::select(vlogs_std_diff_values)
  
  # Return as a list (S3 object)
  structure(list(cd_diff = cd_diff, cds_diff = cds_diff, 
                 vl_diff = vl_diff, vlog_diff = vlog_diff, vlogs_diff = vlogs_diff), 
            class = "interaction")
}

# Declare global variables to avoid warnings
utils::globalVariables(c("cd_diff_values", "cd_std_diff_values", "vl_diff_values", 
                         "vlog_diff_values", "vlogs_std_diff_values"))