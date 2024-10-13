test_that("`plot.interaction()` works as expected", {
  # Load the necessary data
  data("cd_3")
  data("vl_3")
  
  # Create an interaction object using the provided data
  interaction_obj <- create_interactions(cd_3, vl_3)
  
  # Test plotting for all types of differences
  local_edition(3)
  vdiffr::expect_doppelganger(
    title = "interaction plot - all differences",
    fig = plot(interaction_obj)  # Calls the plot method for the interaction object
  )
})