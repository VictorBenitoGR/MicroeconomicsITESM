# Load necessary libraries
library(ggplot2)
library(hrbrthemes)
library(ggpattern)


# Define production capabilities
df1 <- data.frame(
  car_parts = c(0, 50),
  plane_parts = c(100, 0)
)

# Plot PPF with marginal cost
problem22a <- ggplot(df1, aes(x = car_parts, y = plane_parts)) +
  geom_area_pattern(
    pattern = "gradient",
    fill = "#00000000",
    pattern_fill = "#00000000",
    pattern_fill2 = "#10006b"
  ) +
  geom_point(shape = 16, size = 4.5, color = "#00065c") +
  geom_point(shape = 16, size = 2.5, color = "white") +
  geom_segment(aes(y = 0, xend = car_parts, yend = plane_parts),
    color = "#00000079", linetype = "dashed"
  ) +
  geom_segment(aes(x = 0, xend = car_parts, yend = plane_parts),
    color = "#00000079", linetype = "dashed"
  ) +
  ggtitle("FPP de Rolls Royce") +
  labs(
    x = "Partes de automóviles", y = "Partes de aviones",
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
  scale_alpha_identity() +
  coord_fixed() # Fix the aspect ratio

# Save the plot
ggsave("./assets/problem22a.jpg", problem22a, width = 5, height = 5, dpi = 600)

# * -----------------

# Define production capabilities
df2 <- data.frame(
  car_parts = c(0, 120),
  plane_parts = c(40, 0)
)

# Plot PPF with marginal cost
problem22b <- ggplot() +
  geom_area_pattern(
    data = df1,
    aes(x = car_parts, y = plane_parts),
    pattern = "gradient",
    fill = "#00000000",
    pattern_fill = "#00000000",
    pattern_fill2 = "#10006b"
  ) +
  geom_area_pattern(
    data = df2,
    aes(x = car_parts, y = plane_parts),
    pattern = "gradient",
    fill = "#00000000",
    pattern_fill = "#00000000",
    pattern_fill2 = "#b10000d3"
  ) +
  geom_point(data = df1, aes(x = car_parts, y = plane_parts), shape = 16, size = 4.5, color = "#00065c") +
  geom_point(data = df1, aes(x = car_parts, y = plane_parts), shape = 16, size = 2.5, color = "white") +
  geom_point(data = df2, aes(x = car_parts, y = plane_parts), shape = 16, size = 4.5, color = "#b10000d3") +
  geom_point(data = df2, aes(x = car_parts, y = plane_parts), shape = 16, size = 2.5, color = "white") +
  geom_segment(
    data = df1, aes(x = 0, y = 0, xend = car_parts, yend = plane_parts),
    color = "#00000079", linetype = "dashed"
  ) +
  geom_segment(
    data = df1, aes(x = car_parts, y = 0, xend = car_parts, yend = plane_parts),
    color = "#00000079", linetype = "dashed"
  ) +
  geom_segment(
    data = df2, aes(x = 0, y = 0, xend = car_parts, yend = plane_parts),
    color = "#00000079", linetype = "dashed"
  ) +
  geom_segment(
    data = df2, aes(x = car_parts, y = 0, xend = car_parts, yend = plane_parts),
    color = "#00000079", linetype = "dashed"
  ) +
  ggtitle("FPP de Rolls Royce y Volkswagen") +
  labs(
    x = "Partes de automóviles", y = "Partes de aviones",
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
  scale_alpha_identity() +
  coord_fixed() # Fix the aspect ratio

# Save the plot
ggsave("./assets/problem22b.jpg", problem22b, width = 5, height = 5, dpi = 600)

# * -----------------

# Define production capabilities
df3 <- data.frame(
  growing_weath = c(5, 4, 3, 2, 1, 0),
  raising_pigs = c(0, 200, 300, 350, 380, 400)
)

# Plot df3
problem22c <- ggplot() +
  geom_area_pattern(
    data = df3,
    aes(x = growing_weath, y = raising_pigs),
    pattern = "gradient",
    fill = "#00000000",
    pattern_fill = "#00000000",
    pattern_fill2 = "#10006b"
  ) +
  geom_point(data = df3, aes(x = growing_weath, y = raising_pigs), shape = 16, size = 4.5, color = "#00065c") +
  geom_point(data = df3, aes(x = growing_weath, y = raising_pigs), shape = 16, size = 2.5, color = "white") +
  geom_segment(
    data = df3, aes(x = 0, y = raising_pigs, xend = growing_weath, yend = raising_pigs),
    color = "#00000079", linetype = "dashed"
  ) +
  geom_segment(
    data = df3, aes(x = growing_weath, y = 0, xend = growing_weath, yend = raising_pigs),
    color = "#00000079", linetype = "dashed"
  ) +
  ggtitle("FPP del trigo y cerdos") +
  labs(
    x = "Criar cerdos", y = "Cultivar cerdos"
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
ggsave("./assets/problem22c.jpg", problem22c, width = 5, height = 5, dpi = 600)

df4 <- data.frame(
  growing_weath = c(5, 4, 3, 2, 1, 0),
  raising_pigs = c(0, 300, 400, 450, 480, 500)
)

library(dplyr)

# Combine df3 and df4
df_combined <- rbind(df3 %>% mutate(Source = "df3"), df4 %>% mutate(Source = "df4"))

problem22d <- ggplot() +
  geom_area(data = df3, aes(x = growing_weath, y = raising_pigs), fill = "#00065c", alpha = 0.4) +
  geom_point(data = df3, aes(x = growing_weath, y = raising_pigs), shape = 16, size = 4.5, color = "#00065c") +
  geom_point(data = df3, aes(x = growing_weath, y = raising_pigs), shape = 16, size = 2.5, color = "white") +
  geom_segment(
    data = df3, aes(x = 0, y = raising_pigs, xend = growing_weath, yend = raising_pigs),
    color = "#00000079", linetype = "dashed"
  ) +
  geom_segment(
    data = df3, aes(x = growing_weath, y = 0, xend = growing_weath, yend = raising_pigs),
    color = "#00000079", linetype = "dashed"
  ) +
  geom_area(data = df4, aes(x = growing_weath, y = raising_pigs), fill = "#00065c", alpha = 0.4) +
  geom_point(data = df4, aes(x = growing_weath, y = raising_pigs), shape = 16, size = 4.5, color = "#00065c") +
  geom_point(data = df4, aes(x = growing_weath, y = raising_pigs), shape = 16, size = 2.5, color = "white") +
  geom_segment(
    data = df4, aes(x = 0, y = raising_pigs, xend = growing_weath, yend = raising_pigs),
    color = "#00000079", linetype = "dashed"
  ) +
  geom_segment(
    data = df4, aes(x = growing_weath, y = 0, xend = growing_weath, yend = raising_pigs),
    color = "#00000079", linetype = "dashed"
  ) +
  ggtitle("FPP del trigo y cerdos") +
  labs(
    x = "Criar cerdos", y = "Cultivar cerdos"
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
ggsave("./assets/problem22d.jpg", problem22d, width = 5, height = 5, dpi = 600)

# -----------------

df5 <- data.frame(
  price = c(50, 60, 70, 80, 90, 100),
  demand = c(160, 150, 140, 130, 120, 110),
  supply = c(90, 100, 110, 120, 130, 140)
)

library(ggplot2)

plot_df5 <- ggplot(df5, aes(x = price)) +
  geom_line(aes(y = demand), color = 'blue') +
  geom_line(aes(y = supply), color = 'red') +
  labs(x = "Price", y = "Quantity", 
    title = "Market Equilibrium",
    subtitle = "Demand (blue) and Supply (red)") +
  theme_minimal()

ggsave("./assets/plot_df7.jpg", plot_df5, width = 5, height = 5, dpi = 600)
# Interpolate the data
df5_interpolated <- data.frame(price = seq(min(df5$price), max(df5$price), by = 0.01))
df5_interpolated$demand <- approx(df5$price, df5$demand, df5_interpolated$price)$y
df5_interpolated$supply <- approx(df5$price, df5$supply, df5_interpolated$price)$y

# Find the equilibrium point
df5_interpolated$difference <- abs(df5_interpolated$demand - df5_interpolated$supply)
equilibrium <- df5_interpolated[which.min(df5_interpolated$difference), ]
equilibrium_price <- equilibrium$price
equilibrium_quantity <- equilibrium$demand

print(equilibrium_price)
print(equilibrium_quantity)

library(ggplot2)

library(ggplot2)

# Define the price range
price <- seq(0, 100, by = 1)

# Calculate the quantity for each price point
demand <- (100 - price) / 5
supply <- (price - 51) / 2

# Create a data frame
df <- data.frame(price, demand, supply)

# Define the equilibrium point
equilibrium <- data.frame(price = 65, quantity = 7)

# Add the equilibrium point to the plot
plot_df8 <- ggplot(df, aes(x = price)) +
  geom_line(aes(y = demand), color = 'blue') +
  geom_line(aes(y = supply), color = 'red') +
  geom_vline(xintercept = equilibrium$price, linetype = "dashed") +
  geom_hline(yintercept = equilibrium$quantity, linetype = "dashed") +
  geom_point(data = equilibrium, aes(x = price, y = quantity), color = 'black', size = 5) +
  labs(x = "Price", y = "Quantity", 
    title = "Supply and Demand Curves",
    subtitle = "Demand (blue) and Supply (red)") +
  theme_minimal()

ggsave("./assets/plot_df8.jpg", plot_df8, width = 5, height = 5, dpi = 600)

# Define the price range
price <- seq(0, 100, by = 1)

# Calculate the quantity for each price point
demand <- (86 - price) / 5
supply <- (price - 51) / 2

# Create a data frame
df <- data.frame(price, demand, supply)

# Define the equilibrium point
equilibrium <- data.frame(price = 61, quantity = 5)

# Add the equilibrium point to the plot
plot_df9 <- ggplot(df, aes(x = price)) +
  geom_line(aes(y = demand), color = 'blue') +
  geom_line(aes(y = supply), color = 'red') +
  geom_vline(xintercept = equilibrium$price, linetype = "dashed") +
  geom_hline(yintercept = equilibrium$quantity, linetype = "dashed") +
  geom_point(data = equilibrium, aes(x = price, y = quantity), color = 'black', size = 5) +
  labs(x = "Price", y = "Quantity", 
    title = "Supply and Demand Curves",
    subtitle = "Demand (blue) and Supply (red)") +
  theme_minimal()

ggsave("./assets/plot_df9.jpg", plot_df8, width = 5, height = 5, dpi = 600)

# Define the price range
price <- seq(0, 100, by = 1)

# Calculate the quantity for each price point for the first demand equation
demand1 <- (100 - price) / 5

# Calculate the quantity for each price point for the second demand equation
demand2 <- (86 - price) / 5

# Create a data frame for the first demand equation
df1 <- data.frame(price, demand = demand1, equation = "First Demand Equation")

# Create a data frame for the second demand equation
df2 <- data.frame(price, demand = demand2, equation = "Second Demand Equation")

# Combine the two data frames
df <- rbind(df1, df2)

# Plot the demand curves
plot_demand <- ggplot(df, aes(x = price, y = demand, color = equation)) +
  geom_line() +
  labs(x = "Price", y = "Quantity", 
       title = "Comparison of Demand Curves",
       subtitle = "First Demand Equation (blue) and Second Demand Equation (red)") +
  theme_minimal()

ggsave("./assets/plot_demand.jpg", plot_demand, width = 7, height = 5, dpi = 600)


# !

# Define the price range
price <- seq(0, 100, by = 1)

# Calculate the quantity for each price point
demand <- (100 - price) / 5
supply <- (price - 28) / 3

# Create a data frame
df <- data.frame(price, demand, supply)

# Define the equilibrium point
equilibrium <- data.frame(price = 55, quantity = 9)

# Add the equilibrium point to the plot
plot_df8 <- ggplot(df, aes(x = price)) +
  geom_line(aes(y = demand), color = 'blue') +
  geom_line(aes(y = supply), color = 'red') +
  geom_vline(xintercept = equilibrium$price, linetype = "dashed") +
  geom_hline(yintercept = equilibrium$quantity, linetype = "dashed") +
  geom_point(data = equilibrium, aes(x = price, y = quantity), color = 'black', size = 5) +
  labs(x = "Price", y = "Quantity", 
    title = "Supply and Demand Curves",
    subtitle = "Demand (blue) and Supply (red)") +
  theme_minimal()

ggsave("./assets/plot_df8.jpg", plot_df8, width = 5, height = 5, dpi = 600)

# !

# Define the price range
price <- seq(0, 100, by = 1)

# Calculate the quantity for each price point for the first supply equation
supply1 <- (price - 51) / 2

# Calculate the quantity for each price point for the second supply equation
supply2 <- (price - 28) / 3

# Create a data frame for the first supply equation
df1 <- data.frame(price, supply = supply1, equation = "First Supply Equation")

# Create a data frame for the second supply equation
df2 <- data.frame(price, supply = supply2, equation = "Second Supply Equation")

# Combine the two data frames
df <- rbind(df1, df2)

# Plot the supply curves
plot_supply <- ggplot(df, aes(x = price, y = supply, color = equation)) +
  geom_line() +
  labs(x = "Price", y = "Quantity", 
       title = "Comparison of Supply Curves",
       subtitle = "First Supply Equation (blue) and Second Supply Equation (red)") +
  theme_minimal()

ggsave("./assets/plot_supply.jpg", plot_supply, width = 5, height = 5, dpi = 600)