test_that("`print.interaction()` works as expected", {
  data(cd_3)
  data(vl_3)
  
  # Create interaction object using the provided data
  interaction_obj <- create_interactions(cd_3, vl_3)
  
  # Test the print output of the interaction object
  expect_snapshot(
    print(interaction_obj)
  )
})