# 3 point Uturn Visualization

library(Hmisc)
library(plotly)

# Original U-turn path data
X_control <- c(0, 2, 4)  
Z_control <- c(0, 4, 0)  

# Generate Bézier curve
bezier_curve <- bezier(X_control, Z_control, evaluation = 100)

# Create data frames
curve_df <- data.frame(
  X = bezier_curve$x,
  Z = bezier_curve$y,
  text = paste("X:", round(bezier_curve$x, 2), "<br>Z:", round(bezier_curve$y, 2))
)

control_df <- data.frame(
  X = X_control,
  Z = Z_control,
  text = paste("Control Point", 1:3, "<br>X:", X_control, "<br>Z:", Z_control)
)

# Create interactive plot
fig <- plot_ly() %>%
  # Add Bézier curve
  add_trace(
    data = curve_df,
    x = ~X,
    y = ~Z,
    type = 'scatter',
    mode = 'lines',
    line = list(color = 'blue', width = 3),
    hoverinfo = 'text',
    text = ~text,
    name = 'Bézier Curve'
  ) %>%
  
  # Add control points
  add_trace(
    data = control_df,
    x = ~X,
    y = ~Z,
    type = 'scatter',
    mode = 'markers',
    marker = list(color = 'red', size = 10),
    hoverinfo = 'text',
    text = ~text,
    name = 'Control Points'
  ) %>%
  
  # Layout settings
  layout(
    title = "3 point U-Turn Path (Bézier Curve)",
    xaxis = list(title = "X (Distance)"),
    yaxis = list(title = "Z (Position)"),
    hovermode = "closest",
    showlegend = TRUE
  )

# Display the plot
fig