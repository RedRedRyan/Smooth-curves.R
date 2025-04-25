

# Line graph that represents a U-turn
X <- c(0, 0, 0.25, 1, 2, 3, 3.75, 4, 4)  # Example X values
Z <- c(0, 2, 3, 3.75, 4, 3.75, 3, 2, 0)  # Example Z values

plot(X, Z, type = "l", col = "blue", lwd = 2,
     xlab = "X", ylab = "Z", main = "Line Graph of Z against X")