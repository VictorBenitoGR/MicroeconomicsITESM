# * = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * MICROECONOMICS
# * https://github.com/VictorBenitoGR/MicroeconomicsITESM
# * = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# * Packages
library(dplyr) # Data manipulation
library(ggplot2) # Data visualization
library(ggpattern) # Custom geoms from ggplot2
library(hrbrthemes) # Custom themes for ggplot2

# Brasil produce etanol a partir de azúcar, y la tierra utilizada par cultivar
# azúcar puede usarse para cultivar alimentos. Supongamos que las posibilidades
# de producción de Brasil para el etanol y alimentos son:

df <- data.frame(
  df_x = c(0, 1, 2, 3, 4, 5),
  df_y = c(70, 64, 54, 40, 22, 0)
)

# df <- openxlsx(./data/df.xlsx) # nolint: commented_code_linter.

# * Obtén todos los CMg de etanol y producto agrícola
# * Obtain the marginal cost of catching rabbits at each point.
df$marginal_cost_x <- c(
  NA, diff(df$df_x) / diff(df$df_y)
)

df$marginal_cost_y <- c(
  NA, diff(df$df_y) / diff(df$df_x)
)

# * Plot | Production-Possibility Frontier (PPF) with marginal cost
ppf_marginal_cost2 <- ggplot(df, aes(x = df_x, y = df_y)) +
  geom_area_pattern(
    data = df,
    pattern = "gradient",
    fill = "#00000000",
    pattern_fill = "#00000000",
    pattern_fill2 = "#10006b"
  ) +
  ggtitle("Production-Possibility Frontier (PPF) with marginal cost") +
  labs(
    subtitle = "Comparison between element 1 and element 2", # nolint: line_length_linter.
    x = "Element 1", y = "Element 2",
    caption = "R Plot: @VictorBenitoGR | GitHub Repository: VictorBenitoGR/MicroeconomicsITESM" # nolint: line_length_linter.
  ) +
  geom_point(shape = 16, size = 4.5, color = "#00065c") +
  geom_point(shape = 16, size = 2.5, color = "white") +
  geom_segment(aes(y = 0, xend = df_x, yend = df_y),
    color = "#00000079", linetype = "dashed"
  ) +
  geom_segment(aes(x = 0, xend = df_x, yend = df_y),
    color = "#00000079", linetype = "dashed"
  ) +
  theme_ipsum() +
  theme(
    plot.title = element_text(size = 14),
    panel.border = element_blank(),
    axis.line.x = element_line(),
    text = element_text(size = 12),
    axis.ticks = element_blank(),
    axis.text.y = element_text(margin = margin(0, 15, 0, 0, unit = "pt"))
  ) +
  scale_alpha_identity()

# Save the plot
ggsave("./assets/test/ppf_marginal_cost2.jpg", ppf_marginal_cost2,
  width = 8, height = 6
)

View(df)
