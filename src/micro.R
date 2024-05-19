# * Microeconomy

initial_price <- c(200, 160)
final_price <- c(160, 200)
initial_quantity <- c(10, 20)
final_quantity <- c(20, 10)
point_elasticity <- c(NA, NA)
arch_elasticity <- c(NA, NA)

data <- data.frame(initial_price, final_price, initial_quantity, final_quantity, point_elasticity, arch_elasticity)

# Calculate point elasticity
data$point_elasticity <- ((data$final_quantity - data$initial_quantity) / data$initial_quantity) / ((data$final_price - data$initial_price) / data$initial_price)

# Calculate arc elasticity
data$arch_elasticity <- ((data$final_quantity - data$initial_quantity) / ((data$initial_quantity + data$final_quantity) / 2)) / ((data$final_price - data$initial_price) / ((data$initial_price + data$final_price) / 2))

data

# Point
# -5
# -2

# Arch
# -3
# -3
