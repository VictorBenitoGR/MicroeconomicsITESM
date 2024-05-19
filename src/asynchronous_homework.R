# * MICROECONOMICS
# * https://github.com/VictorBenitoGR/MicroeconomicsITESM

# *** PACKAGES ** -------------------------------------------------------------

library(dplyr) # Data manipulation
library(ggplot2) # Data visualization
library(ggpattern) # Custom geoms from ggplot2
library(hrbrthemes) # Custom themes for ggplot2


# *** HOMEWORK *** ------------------------------------------------------------

# Based on the given situation, make a graph illustrating the changes in supply,
# demand, quantity offered and/or quantity demanded. Do not forget to answer the
# question: What happens to the equilibrium price and quantity? Remember to plot
# the supply and demand curves on the same graph (labeling the curves and their
# axes) and show how the market is affected in bold.

# 1. In the Swiss chocolate market, the price goes up.

# Supply and demand data
price <- c(10, 8, 6, 4, 2) # Price levels
quantity_supplied <- c(100, 120, 140, 160, 180) # Quantity supplied
quantity_demanded <- c(180, 160, 140, 120, 100) # Quantity demanded

# Create a data frame
chocolate_market <- data.frame(price, quantity_supplied, quantity_demanded)

# Plotting the supply and demand curves
asynchronous1 <- ggplot(chocolate_market, aes(
  x = quantity_supplied, y = price
)) +
  geom_line(aes(color = "Supply"), size = 1.5) +
  geom_line(aes(
    x = quantity_demanded, y = price, color = "Demand"
  ), linewidth = 1.5) +
  scale_color_manual(values = c("Supply" = "blue", "Demand" = "red")) +
  labs(x = "Quantity", y = "Price", title = "Swiss Chocolate Market") +
  theme_minimal()

# Save the plot
ggsave("./assets/asynchronous1.jpg", asynchronous1,
  width = 8, height = 6
)

# * 2. The media declares quinoa a 'superfood' - what's happening in the quinoa market?

# Quinoa market data
price <- c(10, 8, 6, 4, 2) # Price levels
quantity_supplied <- c(100, 120, 140, 160, 180) # Quantity supplied
quantity_demanded <- c(180, 160, 140, 120, 100) # Quantity demanded

# Create a data frame
quinoa_market <- data.frame(price, quantity_supplied, quantity_demanded)

# Plotting the supply and demand curves
asynchronous2 <- ggplot(quinoa_market, aes(
  x = quantity_supplied, y = price
)) +
  geom_line(aes(color = "Supply"), size = 1.5) +
  geom_line(aes(
    x = quantity_demanded, y = price, color = "Demand"
  ), linewidth = 1.5) +
  scale_color_manual(values = c("Supply" = "blue", "Demand" = "red")) +
  labs(x = "Quantity", y = "Price", title = "Quinoa Market") +
  theme_minimal()

# Save the plot
ggsave("./assets/asynchronous2.jpg", asynchronous2,
  width = 8, height = 6
)

# * 3. In the hearing aid market, the income of the main consumers is decreasing.

# Hearing aid market data
price <- c(10, 8, 6, 4, 2) # Price levels
quantity_supplied <- c(100, 120, 140, 160, 180) # Quantity supplied
quantity_demanded <- c(180, 160, 140, 120, 100) # Quantity demanded

# Create a data frame
hearing_aid_market <- data.frame(price, quantity_supplied, quantity_demanded)

# Plotting the supply and demand curves
asynchronous3 <- ggplot(hearing_aid_market, aes(
  x = quantity_supplied, y = price
)) +
  geom_line(aes(color = "Supply"), size = 1.5) +
  geom_line(aes(
    x = quantity_demanded, y = price, color = "Demand"
  ), linewidth = 1.5) +
  scale_color_manual(values = c("Supply" = "blue", "Demand" = "red")) +
  labs(x = "Quantity", y = "Price", title = "Hearing Aid Market") +
  theme_minimal()

# Save the plot
ggsave("./assets/asynchronous3.jpg", asynchronous3,
  width = 8, height = 6
)
