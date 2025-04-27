
# 4-Point Bézier U-Turn Visualization

library(plotly)
library(RColorBrewer)
library(bezier)

control_points <- data.frame(
  X = c(0, 0, 4, 4),   # X coordinates
  Z = c(0, 2, 2, 0)     # Z coordinates
)

# Generating Bézier Curve
t <- seq(0, 1, length.out = 100)
bezier_curve <- as.data.frame(bezier(t, p = control_points))
colnames(bezier_curve) <- c("X", "Z")

# Color Palette

colors <- brewer.pal(4, "Set1")
curve_color <- colors[1]
point_color <- colors[2]

# Interactive Plot

fig <- plot_ly() %>%
  
  # Add Bézier curve
  add_trace(data = bezier_curve,
            x = ~X, y = ~Z,
            type = 'scatter', mode = 'lines',
            line = list(color = curve_color, width = 4),
            name = 'Bézier Curve',
            hoverinfo = 'text',
            text = ~paste("X:", round(X, 2), "<br>Z:", round(Z, 2))) %>%
  
  # Add control points
  add_trace(data = control_points,
            x = ~X, y = ~Z,
            type = 'scatter', mode = 'markers',
            marker = list(color = point_color, size = 10, line = list(color = 'black', width = 2)),
            name = 'Control Points',
            hoverinfo = 'text',
            text = ~paste("Control Point P", 1:4, "<br>X:", X, "<br>Z:", Z)) %>%
  
  # Add connecting lines for control points
  add_trace(data = control_points,
            x = ~X, y = ~Z,
            type = 'scatter', mode = 'lines',
            line = list(color = 'gray50', width = 1, dash = 'dash'),
            name = 'Control Polygon',
            hoverinfo = 'none') %>%
  
  # Add point labels
  add_annotations(data = control_points,
                  x = ~X, y = ~Z,
                  text = paste0("P", 1:4),
                  xref = "x", yref = "y",
                  showarrow = FALSE,
                  yshift = 15) %>%
  
  # Layout customization
  layout(
    title = "4-Point Bézier U-Turn Path (Interactive)",
    xaxis = list(title = "X Coordinate (Distance)",
                 gridcolor = 'white',
                 zerolinecolor = 'white'),
    yaxis = list(title = "Z Coordinate (Position)",
                 gridcolor = 'white',
                 zerolinecolor = 'white'),
    plot_bgcolor = 'rgb(245, 245, 245)',
    paper_bgcolor = 'rgb(245, 245, 245)',
    legend = list(orientation = 'h', y = -0.2),
    margin = list(b = 100)  # Add space at bottom for footer
  ) %>%
  
  # Footer
  add_annotations(
    text = "Visualization of a smooth U-turn path",
    xref = "paper", yref = "paper",
    x = 1, y = -0.15,
    showarrow = FALSE,
    xanchor = "right",
    font = list(size = 12, color = 'gray30')
  )

# Display the plot
fig