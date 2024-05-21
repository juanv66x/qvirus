#' Simulate Entanglement Evolution
#'
#' This function simulates the evolution of entanglement between two quantum states x1 and x2 using the CNOT gate.
#'
#' @param x1 Quantum state for qubit 1, represented as a qstate object.
#' @param x2 Quantum state for qubit 2, represented as a qstate object.
#' @param iterations Number of iterations for the entanglement process.
#' @param angle Rotation angle for applying Rx gate.
#'
#' @return A list containing the entangled quantum state x2 after each iteration.
#' @export
#'
#' @examples
#' library(qsimulatR)
#' library(qvirus)
#' x1 <- qstate(1, coefs = as.complex(c(0.8, 0.6)))
#' x2 <- qstate(1, coefs = as.complex(c(0.38, 0.92)))
#' simulate_entanglement(x1, x2, iterations = 3, angle = pi/4)
simulate_entanglement <- function(x1, x2, iterations, angle) {
  # Iterate the entanglement process
  for (i in 1:iterations) {
    cat("Iteration:", i, "\n")
    # Print the probabilities of x1 and x2 before entanglement
    cat("x1:", "\n")
    print(qvirus::normalize_check(x1, probs = TRUE))
    cat("x2:", "\n")
    print(qvirus::normalize_check(x2, probs = TRUE))
    
    # Apply the CNOT gate to entangle x1 and x2
    res <- qsimulatR::CNOT(c(2,1)) * qsimulatR::qstate(2, coefs = as.complex(kronecker(x1@coefs, x2@coefs)))
    probs <- qvirus::normalize_check(res, probs = TRUE)
    
    # Update x2 based on entanglement results
    x2 <- qsimulatR::qstate(nbits = 1, 
                            coefs = as.complex(c(sqrt(probs[1] + probs[3]), 
                                                 sqrt(probs[2] + probs[4]))))
    
    # Print the probabilities of x2 after entanglement
    cat("x2 update:", "\n")
    print(qvirus::normalize_check(x2, probs = TRUE))
    
    #angle <- pi/4  # Rotation angle
    entangled_state <- qsimulatR::Rx(1, theta = angle) * res
    
    probsr <- qvirus::normalize_check(entangled_state, probs = TRUE)
    
    # Update x2 based on Rx results
    x2r <- qsimulatR::qstate(nbits = 1, 
                             coefs = as.complex(c(sqrt(probsr[1] + probsr[3]), 
                                                  sqrt(probsr[2] + probsr[4]))))
    cat("x2r update:", "\n")
    print(qvirus::normalize_check(x2r, probs = TRUE))
  }
}
