#' Longitudinal CD4 Lymphocyte Counts for HIV Patients (2018-2024)
#'
#' @description Contains longitudinal measurements of CD4 lymphocyte counts for 
#' 176 patients living with HIV, recorded over the period from 2018 to 2024. 
#' CD4 counts are a critical indicator of immune function, used to monitor the 
#' progression of HIV and the effectiveness of treatments. Measurements were 
#' taken at various points throughout the study, with some missing values due 
#' to unavailable data for specific patients at certain times.
#'
#' @format A data frame with 176 rows and 18 variables:
#' \describe{
#'   \item{ID}{Unique identifier for each patient.}
#'   \item{cd_2018_1 to cd_2024_3}{Longitudinal CD4 lymphocyte count 
#'   measurements. The naming convention follows the year (from 2018 to 2024) 
#'   and the measurement period within the year (1, 2, or 3). Values are 
#'   recorded in cells per micro liter of blood.}
#' }
#'
#' @details .
#' CD4 counts are used to monitor immune system health in individuals with 
#' HIV. A lower CD4 count often indicates a weakened immune system, whereas 
#' higher counts suggest a stronger immune response. Some values are missing, 
#' indicating no measurement was taken for a particular patient at that time.
#'
#' @examples
#' # Load the dataset
#' data(cd_3)
#'
#' # Summarize CD4 counts for the year 2021
#' summary(cd_3[, c("cd_2021_1", "cd_2021_2", "cd_2021_3")])
#'
#' @source Clinical data from Hospital Vicente Guerrero, IMSS, HIV Clinic.
"cd_3"


#' Longitudinal Viral Load Values for HIV Patients (2018-2024)
#'
#' @description Contains longitudinal measurements of viral load for 176 
#' patients from 2018 to 2024. Viral load is a critical marker used to monitor 
#' the effectiveness of HIV treatment by measuring the amount of HIV RNA in the 
#' blood.
#'
#' @format A data frame with 176 rows and 18 variables:
#' \describe{
#'   \item{ID}{Unique identifier for each patient.}
#'   \item{vl_2018_1 to vl_2024_3}{Viral load measurements taken at various 
#'   points in time between 2018 and 2024. The naming structure represents the 
#'   year of the measurement (e.g., 2018, 2019, etc.), and the point in time 
#'   within the year (1, 2, or 3). Units are in copies of HIV RNA per milliliter 
#'   of blood.}
#' }
#'
#' @details
#' The viral load measurements provide insight into the patient's response to 
#' antiretroviral therapy (ART). Lower viral load values, especially 
#' undetectable levels, indicate better control of the infection. Missing 
#' values indicate that no viral load measurement was available for that patient 
#' at that specific time.
#'
#' @examples
#' \dontrun{
#' # Load the dataset
#' data(vl_3)
#'
#' # Summarize viral loads for the year 2021
#' summary(vl_3[, c("cd_2021_1", "cd_2021_2", "cd_2021_3")])
#' }
#'
#' @source Clinical data from Hospital Vicente Guerrero, IMSS, HIV Clinic.
"vl_3"
