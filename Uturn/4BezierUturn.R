# ==============================================
# 4-Point Bézier U-Turn Visualization


library(Hmisc)
library(RColorBrewer)


control_points <- data.frame(
  X = c(0, 0, 4, 4),   # X coordinates
  Z = c(0, 2, 2, 0)     # Z coordinates
)


bezier_curve <- bezier(
  control_points$X,
  control_points$Z,
  evaluation = 100  # Increased for smoother curve
)

# --------------------------
# 5. Color Palette

colors <- brewer.pal(4, "Set1")
curve_color <- colors[1]
point_color <- colors[2]
bg_color <- "gray95"

# --------------------------
par(bg = bg_color, family = "sans")  # Set background and font

plot(bezier_curve, 
     type = "l", 
     col = curve_color, 
     lwd = 4,
     xlab = "X Coordinate (Distance)", 
     ylab = "Z Coordinate (Position)", 
     main = "4-Point Bézier U-Turn Path",
     xlim = extendrange(control_points$X, f = 0.1),
     ylim = extendrange(control_points$Z, f = 0.1),
     panel.first = grid(lty = 1, col = "white"))

# Add control points with connecting lines
points(control_points$X, control_points$Z, 
       pch = 21, 
       bg = point_color, 
       col = "black", 
       cex = 2, 
       lwd = 2)

# Add connecting lines for control points
lines(control_points$X, control_points$Z, 
      lty = 2, 
      col = "gray50")

# Add legend
legend("topright",
       legend = c("Bézier Curve", "Control Points", "Control Polygon"),
       col = c(curve_color, point_color, "gray50"),
       lty = c(1, NA, 2),
       pch = c(NA, 19, NA),
       lwd = c(3, NA, 1),
       pt.cex = c(NA, 1.5, NA),
       bg = "white")

# --------------------------

text(control_points$X, control_points$Z, 
     labels = paste0("P", 1:4), 
     pos = 3, 
     col = "black", 
     cex = 1.2)

# Add footer note
mtext("Visualization of 4-point Bézier U-turn path", 
      side = 1, 
      line = 4, 
      adj = 1, 
      cex = 0.8, 
      col = "gray30")
