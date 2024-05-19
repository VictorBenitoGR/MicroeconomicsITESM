# * = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * MICROECONOMICS
# * https://github.com/VictorBenitoGR/MicroeconomicsITESM
# * = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# * Imagine you are in the middle of nowhere and you can only hunt rabbits or
# * pick blackberries to feed yourself.
# Rabbits: 5, 4, 3, 2, 1, 0
# Blackberries: 0, 100, 180, 240, 280, 300

# * Packages
library(dplyr) # Data manipulation
library(ggplot2) # Data visualization
library(ggpattern) # Custom geoms from ggplot2
library(gganimate) # // Animated plots with ggplot2
library(babynames) # // Baby names dataset
library(hrbrthemes) # Custom themes for ggplot2
library(grid) # // Graphic system base
library(png) # // PNG image handling

# * Create the DF with the given info
df1 <- data.frame(
  rabbits = c(5, 4, 3, 2, 1, 0),
  blackberries = c(0, 100, 180, 240, 280, 300)
)

# * Plot | Production-Possibility Frontier (PPF)
ppf <- ggplot(df1, aes(x = rabbits, y = blackberries)) +
  geom_line() +
  geom_point() +
  labs(
    title = "Production-Possibility Frontier",
    x = "Number of Rabbits",
    y = "Number of blackberries"
  ) +
  theme_linedraw()

# * Obtain the marginal cost of catching rabbits at each point.
df1$marginal_cost_etanol <- c(NA, diff(df1$blackberries) / diff(df1$rabbits))
df1$marginal_cost <- c(NA, diff(df1$blackberries) / diff(df1$rabbits))
View(df1)
# * Plot | Production-Possibility Frontier (PPF) with marginal cost
ppf_marginal_cost <- ggplot(df1, aes(x = rabbits, y = blackberries)) +
  geom_area_pattern(
    data = df1,
    pattern = "gradient",
    fill = "#00000000",
    pattern_fill = "#00000000",
    pattern_fill2 = "#10006b"
  ) +
  geom_point(shape = 16, size = 4.5, color = "#00065c") +
  geom_point(shape = 16, size = 2.5, color = "white") +
  geom_segment(aes(y = 0, xend = rabbits, yend = blackberries),
    color = "#00000079", linetype = "dashed"
  ) +
  geom_segment(aes(x = 0, xend = rabbits, yend = blackberries),
    color = "#00000079", linetype = "dashed"
  ) +
  annotate(
    "text",
    label = "Inefficient",
    x = 1.5, y = 140, size = 4, colour = "#b10000d3", fontface = "bold"
  ) +
  annotate(
    "text",
    label = "Impossible",
    x = 4, y = 240, size = 4, colour = "#b10000d3", fontface = "bold"
  ) +
  annotate("text",
    x = 0.5, y = 300,
    label = -20, # marginal_cost
    hjust = 0.5,
    size = 5,
    fontface = "bold"
  ) +
  annotate("text",
    x = 1.5, y = 280,
    label = -40, # marginal_cost
    hjust = 0.5,
    size = 5,
    fontface = "bold"
  ) +
  annotate("text",
    x = 2.5, y = 230,
    label = -60, # marginal_cost
    hjust = 0.5,
    size = 5,
    fontface = "bold"
  ) +
  annotate("text",
    x = 3.5, y = 160,
    label = -80, # marginal_cost
    hjust = 0.5,
    size = 5,
    fontface = "bold"
  ) +
  annotate("text",
    x = 4.5, y = 80,
    label = -100, # marginal_cost
    hjust = 0.5,
    size = 5,
    fontface = "bold"
  ) +
  ggtitle("Production-Possibility Frontier (PPF) with margin cost | 🐇 Vs 🍇") +
  labs(
    subtitle = "Imagine you are in the middle of nowhere and you can only hunt rabbits or pick blackberries to feed yourself.", # nolint: line_length_linter.
    x = "Number of Rabbits", y = "Number of Blackberries",
    caption = "R Plot: @VictorBenitoGR | GitHub Repository: VictorBenitoGR/MicroeconomicsITESM" # nolint: line_length_linter.
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
ggsave("./assets/ppf_marginal_cost.jpg", ppf_marginal_cost,
  width = 8, height = 6
)
