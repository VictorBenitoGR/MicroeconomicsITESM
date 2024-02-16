# * = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * MICROECONOMICS
# * = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# * Imagine you are in the middle of nowhere and you can only hunt rabbits or
# * pick blackberries to feed yourself.
# Rabbits: 5, 4, 3, 2, 1, 0
# Blackberries: 0, 100, 180, 240, 280, 300

# * Packages
library(dplyr) # Data manipulation
library(ggplot2) # Data visualization
library(gganimate) # Animated plots with ggplot2
library(babynames) # Baby names dataset
library(hrbrthemes) # Custom themes for ggplot2

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

# Calculate the marginal cost at each point
data$marginal_cost <- c(NA, diff(data$blackberries) / diff(data$rabbits))
print(data)
data$difference <- c(NA, diff(data$blackberries))

# Plot | Production-Possibility Frontier (PPF) with marginal cost
ppf_marginal_cost <- ggplot(data, aes(x = rabbits, y = blackberries)) +
  geom_line(color = "#ff0000", size = 2, alpha = 0.9, linetype = 1) +
  geom_text(aes(label = difference), vjust = 0, hjust = -2.5, size = 5) +
  geom_point(shape = 19, color = "black", size = 5) + # , fill = ,
  labs(
    title = "Production-Possibility Frontier (PPF) with margin cost",
    x = "Number of Rabbits",
    y = "Number of Blackberries"
  ) +
  theme_ipsum() +
  labs(
    title = "Production-Possibility Frontier (PPF) with margin cost",
    x = "Number of Rabbits", y = "Number of Blackberries"
  ) +
  theme(plot.title = element_text(face = "bold"))

ggsave("./assets/ppf_marginal_cost.jpg", ppf_marginal_cost,
  width = 8, height = 6
)
