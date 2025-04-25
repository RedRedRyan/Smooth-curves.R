# Original data (U-turn path)
X <- c(0, 0, 0.25, 1, 2, 3, 3.75, 4, 4)
Z <- c(0, 2, 3, 3.75, 4, 3.75, 3, 2, 0)

# Generate 100 interpolated points using cubic spline
spline_fit <- spline(X, Z, n = 100, method = "natural")  # "natural" prevents overshooting

# Plot the smoothed U-turn
plot(spline_fit, type = "l", col = "blue", lwd = 3,
     xlab = "X (Distance)", ylab = "Z (Position)", 
     main = "Smoothed U-Turn Path (Cubic Spline)")
points(X, Z, pch = 19, col = "red", cex = 1.2)  # Overlay original points
grid()  # Add grid for clarity