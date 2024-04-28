test_that("simulateDrugProteinBinding works", {
  # Load necessary libraries
  library(testthat)
  library(qvirus)  # Assuming qvirus package is used for quantum operations
  
  # Define Drug and Protein states for testing
  Drug_State <- qstate(1, coefs = as.complex(c(1, 0)))  # State |0>
  Protein_State <- qstate(1, coefs = as.complex(c(1, 0)))  # State |0>
    
    # Test separable states (kronecker + CNOT + RX) for drug-protein binding
    expect_snapshot(
      print(
        simulateDrugProteinBinding(Drug_State, Protein_State, entanglement_type = "separable")
      )
    )
  })

