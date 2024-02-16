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
library(gganimate) # // Animated plots with ggplot2
library(babynames) # // Baby names dataset
library(hrbrthemes) # Custom themes for ggplot2
library(grid) # // Graphic system base
library(png) # // PNG image handling

# * Create the DF with the given info
data <- data.frame(
  rabbits = c(5, 4, 3, 2, 1, 0),
  blackberries = c(0, 100, 180, 240, 280, 300)
)

# * Plot | Production-Possibility Frontier (PPF)
ppf <- ggplot(data, aes(x = rabbits, y = blackberries)) +
  geom_line() +
  geom_point() +
  labs(
    title = "Production-Possibility Frontier",
    x = "Number of Rabbits",
    y = "Number of blackberries"
  ) +
  theme_linedraw()

# * Obtain the opportunity cost of catching rabbits at
# * each point on the graph (marginal cost).
data$marginal_cost <- c(NA, diff(data$blackberries) / diff(data$rabbits))
print(data)

# * Plot | Production-Possibility Frontier (PPF) with marginal cost
ppf_marginal_cost <- ggplot(data, aes(x = rabbits, y = blackberries)) +
  geom_area(fill = "#69b3a2", alpha = 0.4) +
  geom_line(color = "#ff0000", size = 2, alpha = 0.9, linetype = 1) +
  geom_text(aes(label = marginal_cost), vjust = 0.3, hjust = -1.5, size = 5) +
  geom_segment(aes(y = 0, xend = rabbits, yend = blackberries),
    color = "black", linetype = "dashed"
  ) +
  geom_segment(aes(x = 0, xend = rabbits, yend = blackberries),
    color = "black", linetype = "dashed"
  ) +
  annotate(
    "text",
    label = "Inefficient",
    x = 1.5, y = 140, size = 5, colour = "#000000"
  ) +
  annotate(
    "text",
    label = "Impossible",
    x = 4, y = 240, size = 5, colour = "#000000"
  ) +
  geom_point(shape = 19, color = "black", size = 5) + # , fill = ,
  theme_ipsum() +
  labs(
    title = "Production-Possibility Frontier (PPF) with margin cost | 🐇 Vs 🍇",
    subtitle = "Imagine you are in the middle of nowhere and you can only hunt rabbits or pick blackberries to feed yourself.", # nolint: line_length_linter.
    x = "Number of Rabbits", y = "Number of Blackberries",
    caption = "R Plot: @VictorBenitoGR | GitHub Repository: VictorBenitoGR/MicroeconomicsITESM", # nolint: line_length_linter.
  )

# Save the plot
ggsave("./assets/ppf_marginal_cost.jpg", ppf_marginal_cost,
  width = 8, height = 6
)
