
library(Hmisc)

# Right turn
X <- c(0, 0, 4)  
Z <- c(0, 4, 4)  

# Generate Bézier curve with 100 points
bezier_curve <- bezier(X, Z, evaluation = 20)

# Create the plot
plot(bezier_curve, type = "l", col = "blue", lwd = 3,
     xlab = "X (Distance)", ylab = "Z (Position)", 
     main = "Right Turn (Bézier Curve)",
     xlim = range(X), ylim = range(Z))

# Add original control points
points(X, Z, pch = 19, col = "red", cex = 1.2)
grid()

