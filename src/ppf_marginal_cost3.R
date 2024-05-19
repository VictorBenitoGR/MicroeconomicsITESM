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
  a_x = c(0, 8),
  a_y = c(0, 10),
  b_x = c(0, 6),
  b_y = c(0, 4)
)

View(df)

# df <- openxlsx(./data/df.xlsx) # nolint: commented_code_linter.

# * Obtén todos los CMg de etanol y producto agrícola
# * Obtain the marginal cost of catching rabbits at each point.
df$marginal_cost_a_x <- c(
  NA, diff(df$a_x) / diff(df$a_y)
)

df$marginal_cost_a_y <- c(
  NA, diff(df$a_y) / diff(df$a_x)
)

df$marginal_cost_b_x <- c(
  NA, diff(df$b_x) / diff(df$b_y)
)

df$marginal_cost_b_y <- c(
  NA, diff(df$b_y) / diff(df$b_x)
)

View(df)

# * Plot | Production-Possibility Frontier (PPF) with marginal cost
ppf_marginal_cost1 <- ggplot(df, aes(x = a_x, y = a_y)) +
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
  geom_segment(aes(y = 0, xend = a_x, yend = a_y),
    color = "#00000079", linetype = "dashed"
  ) +
  geom_segment(aes(x = 0, xend = a_x, yend = a_y),
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

ppf_marginal_cost2 <- ggplot(df, aes(x = b_x, y = b_y)) +
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
  geom_segment(aes(y = 0, xend = b_x, yend = b_y),
    color = "#00000079", linetype = "dashed"
  ) +
  geom_segment(aes(x = 0, xend = b_x, yend = b_y),
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

ppf_marginal_cost <- ppf_marginal_cost1 + ppf_marginal_cost2

# Save the plot
ggsave("./assets/test/ppf_marginal_cost.jpg", ppf_marginal_cost,
  width = 8, height = 6
)

View(df)
