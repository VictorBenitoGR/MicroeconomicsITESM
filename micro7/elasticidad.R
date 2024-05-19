pizza_per_hour <- c(0, 10, 20, 30, 40, 50)
usd_per_pizza <- c(25, 20, 15, 10, 5, 0)
problem <- data.frame(pizza_per_hour, usd_per_pizza)



# Calculate the elasticity when the price changes from $25 to $15
elasticity <- function(price_change, quantity_change) {
  price_initial <- 25
  quantity_initial <- problem$usd_per_pizza[which(problem$pizza_per_hour == 0)]
  price_final <- price_initial - price_change
  quantity_final <- quantity_initial - quantity_change

  elasticity <- (quantity_final / quantity_initial) / (price_final / price_initial)
  return(elasticity)
}

elasticity(10, 5)
