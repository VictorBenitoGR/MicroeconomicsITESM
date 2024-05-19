library(ggplot2)

# Basándote en la siguiente aseveración “in-house brands at Walmart are
# snatching sales away from branded goods from suppliers like Procter & Gamble
# and Unilever, which have jacked up prices to protect margins.” Utilizando una
# gráfica de oferta y demanda, representa el impacto que tiene la disminución
# del ingreso real para un jabón de Unilever y un jabón genérico de Walmart.

# Define the quantity range
Cantidad <- seq(0, 100, by = 1)

# Calculate the price for each quantity point for Unilever demand (higher price, lower quantity)
price_unilever_demand <- 120 - Cantidad # Changed from Walmart's values

# Calculate the price for each quantity point for Unilever supply (lower price, higher quantity)
price_unilever_supply <- 70 + Cantidad # Changed from Walmart's values

# Calculate the price for each quantity point for Walmart demand (higher price, lower quantity)
price_walmart_demand <- 100 - Cantidad # Changed from Unilever's values

# Calculate the price for each quantity point for Walmart supply (lower price, higher quantity)
price_walmart_supply <- 50 + Cantidad # Changed from Unilever's values

# Create a data frame for Unilever demand
df_unilever_demand <- data.frame(Cantidad, Precio = price_unilever_demand, company = "Unilever", type = "Demand")

# Create a data frame for Unilever supply
df_unilever_supply <- data.frame(Cantidad, Precio = price_unilever_supply, company = "Unilever", type = "Supply")

# Create a data frame for Walmart demand
df_walmart_demand <- data.frame(Cantidad, Precio = price_walmart_demand, company = "Walmart", type = "Demand")

# Create a data frame for Walmart supply
df_walmart_supply <- data.frame(Cantidad, Precio = price_walmart_supply, company = "Walmart", type = "Supply")

# Combine the four data frames
df <- rbind(df_unilever_demand, df_unilever_supply, df_walmart_demand, df_walmart_supply)

# Plot the demand and supply curves
plot_demand_supply <- ggplot() +
  geom_line(data = df_unilever_demand, aes(x = Cantidad, y = Precio), color = "blue") +
  geom_line(data = df_unilever_supply, aes(x = Cantidad, y = Precio), color = "blue") +
  geom_line(data = df_walmart_demand, aes(x = Cantidad, y = Precio), color = "red") +
  geom_line(data = df_walmart_supply, aes(x = Cantidad, y = Precio), color = "red") +
  scale_x_continuous(labels = NULL) +
  scale_y_continuous(labels = NULL) +
  labs(
    title = "Demand and Supply Curves",
    subtitle = "Unilever (blue), Walmart (red)"
  ) +
  theme_minimal()

ggsave("./assets/plot_demand_supply.jpg", plot_demand_supply, width = 5, height = 5, dpi = 600)

# Calculate the new price for each quantity point for Unilever demand (higher price, lower quantity)
price_unilever_demand_new <- 120 - (Cantidad + 10) # Changed from Walmart's values

# Calculate the new price for each quantity point for Walmart demand (higher price, lower quantity)
price_walmart_demand_new <- 110 - (Cantidad - 20) # Changed from Unilever's values

# Create a data frame for new Unilever demand
df_unilever_demand_new <- data.frame(Cantidad, Precio = price_unilever_demand_new, company = "Unilever", type = "New Demand")

# Create a data frame for new Walmart demand
df_walmart_demand_new <- data.frame(Cantidad, Precio = price_walmart_demand_new, company = "Walmart", type = "New Demand")

# Combine the six data frames
df <- rbind(df_unilever_demand, df_unilever_supply, df_walmart_demand, df_walmart_supply, df_unilever_demand_new, df_walmart_demand_new)

# Create a new supply line for Unilever that is shifted to the left
df_unilever_supply_new <- df_unilever_supply
df_unilever_supply_new$Cantidad <- df_unilever_supply_new$Cantidad - 10

# Update the Unilever plot to include the new supply line and the new demand line
plot_unilever <- ggplot() +
  geom_line(data = df_unilever_demand, aes(x = Cantidad, y = Precio), color = "blue") +
  geom_line(data = df_unilever_supply, aes(x = Cantidad, y = Precio), color = "blue") +
  geom_line(data = df_unilever_demand_new, aes(x = Cantidad, y = Precio), color = "blue", linetype = "dashed") +
  geom_line(data = df_unilever_supply_new, aes(x = Cantidad, y = Precio), color = "blue", linetype = "dashed") +
  scale_x_continuous(labels = NULL) +
  scale_y_continuous(labels = NULL) +
  labs(
    title = "Oferta y demanda de Unilever/P&G",
    subtitle = "Original (normal), nuevo (punteado)"
  ) +
  theme_minimal()

# Create a plot for Walmart
plot_walmart <- ggplot() +
  geom_line(data = df_walmart_demand, aes(x = Cantidad, y = Precio), color = "red") +
  geom_line(data = df_walmart_supply, aes(x = Cantidad, y = Precio), color = "red") +
  geom_line(data = df_walmart_demand_new, aes(x = Cantidad, y = Precio), color = "red", linetype = "dashed") +
  scale_x_continuous(labels = NULL) +
  scale_y_continuous(labels = NULL) +
  labs(
    title = "Oferta y demanda en Walmart",
    subtitle = "Original (normal), nuevo (punteado)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(face = "bold"),
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold")
  )

library(gridExtra)

# Combine the two plots into one image
grid.arrange(plot_unilever, plot_walmart, ncol = 2)

# Save the image
ggsave("./assets/plot_demand_supply.jpg", grid.arrange(plot_unilever, plot_walmart, ncol = 2), width = 10, height = 5, dpi = 600)

# Update the Unilever plot to include the even further shifted new supply line and the shifted new demand line
plot_unilever <- ggplot() +
  geom_line(data = df_unilever_demand, aes(x = Cantidad, y = Precio), color = "blue") +
  geom_line(data = df_unilever_supply, aes(x = Cantidad, y = Precio), color = "blue") +
  geom_line(data = df_unilever_demand_new, aes(x = Cantidad, y = Precio), color = "blue", linetype = "dashed") +
  geom_line(data = df_unilever_supply_new, aes(x = Cantidad, y = Precio), color = "blue", linetype = "dashed") +
  scale_x_continuous(labels = NULL) +
  scale_y_continuous(labels = NULL) +
  labs(
    title = "Oferta y demanda en Unilever",
    subtitle = "Original (normal), nuevo (punteado)",
    x = "Cantidad",
    y = "Precio"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(face = "bold"),
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold")
  )

# Combine the two plots into one image
grid.arrange(plot_unilever, plot_walmart, ncol = 2)

# Save the image
ggsave("./assets/plot_demand_supply.jpg", grid.arrange(plot_unilever, plot_walmart, ncol = 2), width = 10, height = 5, dpi = 600)

# Adjust the price values for Walmart to be significantly lower
df_walmart_demand$Precio <- df_walmart_demand$Precio - 100
df_walmart_supply$Precio <- df_walmart_supply$Precio - 100
df_walmart_demand_new$Precio <- df_walmart_demand_new$Precio - 100

# Combine the six data frames
df <- rbind(df_unilever_demand, df_unilever_supply, df_walmart_demand, df_walmart_supply, df_unilever_demand_new, df_walmart_demand_new)

# Plot the demand and supply curves
plot_demand_supply <- ggplot(df, aes(x = Cantidad, y = Precio, color = company, linetype = type)) +
  geom_line() +
  labs(
    title = "Demand and Supply Curves",
    subtitle = "Unilever (top), Walmart (bottom)",
    x = "Cantidad",
    y = "Precio"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(face = "bold"),
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold")
  )

# Save the image
ggsave("./assets/plot_demand_supply2.jpg", plot_demand_supply, width = 10, height = 5, dpi = 600)

# Los analistas calculan que las ventas en Burlington, una tienda por
# departamentos de descuento, crecieron un 13,2% interanual en el primer
# trimestre de este año, en comparación con una caída del 4,2% en Macy's, una
# institución de la clase media. Se espera que el crecimiento en Walmart, un
# minorista de gran superficie preferido por los ahorradores, haya sido
# respetable en un 4,9% para América el último trimestre, La segunda
# consecuencia de la salud desigual de los consumidores es que, mientras los
# compradores adinerados siguen derrochando en cosas finas, las empresas en el
# extremo vaciador de carteras del espectro de precios siguen prosperando. El
# año pasado, el mercado de bienes de lujo en Estados Unidos creció un 8,7%, muy
# por encima de la inflación, según Euromonitor, una firma de investigación de
# mercado. El 12 de abril, LVMH, el conglomerado de lujo más grande del mundo y
# propietario de Tiffany & Co, informó un crecimiento de las ventas del primer
# trimestre del 8% interanual en Estados Unidos, una disminución del 15% en 2022
# pero aún enérgico.


# Grafica qué es lo que ha sucedido con la demanda de los siguientes mercados
# desde hace 12 meses. Acompaña cada gráfica con una explicación detallando
# cuáles de los factores que afectan la demanda inciden en estos cambios.

# A) Tiffany & Co.

# Crear un dataframe con datos ficticios para representar el cambio en la demanda
df_tiffany <- data.frame(
  Precio = c(10:1, 10:1),
  Cantidad = c(1:10, 2:11),
  Periodo = rep(c("Antes", "Después"), each = 10)
)

# Gráfica para Tiffany & Co.
tiffany <- ggplot(df_tiffany, aes(x = Cantidad, y = Precio, linetype = Periodo, color = Periodo)) +
  geom_line() +
  scale_color_manual(values = c("Antes" = "blue", "Después" = "blue")) +
  theme_minimal() +
  theme(
    text = element_text(face = "bold"),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  ) +
  labs(
    title = "Cambio en la demanda de Tiffany & Co.",
    x = "Cantidad",
    y = "Precio"
  )

# Guardar la gráfica
ggsave("./assets/tiffany.jpg", tiffany, width = 10, height = 5, dpi = 600)

# B) Macy’s Analysts reckon that sales at Burlington, a discount department
# store, grew by 13.2% year on year in the first quarter of this year, compared
# with a decline of 4.2% for Macy’s, a middle-class stalwart.

# Crear un dataframe con datos ficticios para representar el cambio en la demanda
df_macys <- data.frame(
  Precio = c(10:1, 10:1),
  Cantidad = c(1:10, 0:9),
  Periodo = rep(c("Antes", "Después"), each = 10)
)

# Gráfica para Macy's
macys <- ggplot(df_macys, aes(x = Cantidad, y = Precio, linetype = Periodo, color = Periodo)) +
  geom_line() +
  scale_color_manual(values = c("Antes" = "red", "Después" = "red")) +
  theme_minimal() +
  theme(
    text = element_text(face = "bold"),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  ) +
  labs(
    title = "Cambio en la demanda de Macy's",
    x = "Cantidad",
    y = "Precio"
  )

# Guardar la gráfica
ggsave("./assets/macys.jpg", macys, width = 10, height = 5, dpi = 600)

# C) Walmart
# Growth at Walmart, a big-box retailer favoured by the thrifty, is expected to
# have clocked in at a respectable 4.9% for America last quarter, while
# Albertsons and Kroger, two mid-range supermarkets, are forecast to eke out a
# meagre 2.5% and 1.3%, respectively. A similar pattern is on display within
# retailers: in-house brands at Walmart are snatching sales away from branded
# goods from other suppliers

# Crear un dataframe con datos ficticios para representar el cambio en la demanda
df_walmart <- data.frame(
  Precio = c(10:1, 10:1),
  Cantidad = c(1:10, 2:11),
  Periodo = rep(c("Antes", "Después"), each = 10)
)

# Gráfica para Walmart
walmart <- ggplot(df_walmart, aes(x = Cantidad, y = Precio, linetype = Periodo, color = Periodo)) +
  geom_line() +
  scale_color_manual(values = c("Antes" = "#007049", "Después" = "#007049")) +
  theme_minimal() +
  theme(
    text = element_text(face = "bold"),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  ) +
  labs(
    title = "Cambio en la demanda de Walmart",
    x = "Cantidad",
    y = "Precio"
  )

# Guardar la gráfica
ggsave("./assets/walmart.jpg", walmart, width = 10, height = 5, dpi = 600)

# * PART 2 --------------------------------------------------------------------

# * La escasez de queso crema
#   Una gran escasez de queso crema ha afectado a la ciudad de Nueva York.
#   Junior's Restaurants anunció que tuvieron que cerrar varias veces durante la
#   última semana porque no tenían suficiente ingrediente. El amado pastel de
#   queso de la compañía está hecho con aproximadamente un 85 % de queso crema,
#   por lo que es imposible prepararlo sin ese ingrediente clave. El cheesecake
#   de Junior's se vende a miles de minoristas nacionales, así como a
#   restaurantes, directamente a los consumidores y en sus propios cuatro
#   restaurantes. Cada año, Junior's gasta alrededor de cuatro millones de
#   libras de queso crema para hacer su producto estrella. El queso crema es uno
#   de los últimos ingredientes que escasea, ya que los vendedores de alimentos
#   se esfuerzan por satisfacer la elevada demanda, ya que la escasez de mano de
#   obra y la congestión portuaria han causado estragos en la cadena de
#   suministro. Las tiendas de bagels también han sido víctimas de la crisis del
#   queso crema, según un informe de The New York Times. Las tiendas de bagels
#   de Nueva York gastan miles de libras de queso crema cada semana, pero la
#   escasez ha hecho que muchos dueños de tiendas conduzcan más allá de los
#   límites estatales para satisfacer la demanda. Kraft Heinz (KHC), propietaria
#   de queso Philadelphia, había visto aumentar la demanda de queso crema tanto
#   en restaurantes como en tiendas de comestibles incluso antes de la temporada
#   navideña. “Estamos maximizando nuestra producción para satisfacer la demanda
#   sin precedentes”, dijo la compañía a CNN Business en un comunicado, y agregó
#   que está enviando entre un 30 y un 35 % más queso crema a los restaurantes
#   que el año pasado. Sin embargo, Kraft tiene una solución a la escasez de
#   queso crema que está arruinando los planes de fiestas decembrinas: la
#   compañía dice que pagará a los clientes $20 USD por hacer un postre
#   diferente. A través de un sitio web llamado SpreadTheFeeling.com, hasta
#   18,000 personas podrán reclamar el reembolso de su regalo de vacaciones el
#   17 y 18 de diciembre.

# Junior’s es una empresa que se dedica a hacer cheesecakes y comida rápida.
# Ceteris paribus, grafica el impacto que tuvo la implementación de robots en el
# proceso de producción utilizando una gráfica de FPP de Junior’s y otra de
# oferta y demanda de su cheesecake. Explica cada una.

library(ggplot2)
library(gridExtra)
library(hrbrthemes)

# Load necessary packages
library(dplyr)
library(ggplot2)

# Create the first dataframe for "Antes"
df_before <- data.frame(
  machines = c(0, 10),
  cheesecakes = c(8, 0),
  period = "Antes de añadir máquinas"
)

# Create the second dataframe for "Después"
df_after <- data.frame(
  machines = c(0, 13),
  cheesecakes = c(30, 0), # Increase the cheesecakes values
  period = "Después de añadir máquinas"
)

# Combine the dataframes
df_juniors <- rbind(df_before, df_after)

# Plot df_juniors
juniors_plot <- ggplot() +
  geom_area(data = df_juniors[df_juniors$period == "Después de añadir máquinas", ], aes(x = machines, y = cheesecakes, fill = period), alpha = 0.5) +
  geom_area(data = df_juniors[df_juniors$period == "Antes de añadir máquinas", ], aes(x = machines, y = cheesecakes, fill = period), alpha = 0.7) +
  ggtitle("FPP de Junior's Restaurants") +
  labs(
    x = "N° de productores", y = "Cheesecakes"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"), # Make title bold
    panel.border = element_blank(),
    axis.line.x = element_line(),
    text = element_text(size = 12, face = "bold"), # Make all other text bold
    axis.ticks = element_blank(),
    axis.text.x = element_blank(), # Remove x-axis labels
    axis.text.y = element_blank() # Remove y-axis labels
  ) +
  scale_alpha_identity() +
  scale_fill_manual(values = c("Antes de añadir máquinas" = "#0000ffcb", "Después de añadir máquinas" = "#ff0000")) # Change the colors

# Save the plot
ggsave("./assets/juniors_plot.jpg", juniors_plot, width = 10, height = 5, dpi = 600)


# Oferta y demanda

# Create data for demand curve
demand <- data.frame(
  Quantity = seq(0, 100, by = 1),
  Price = 100 - seq(0, 100, by = 1)
)

# Create data for original supply curve
supply1 <- data.frame(
  Quantity = seq(0, 100, by = 1),
  Price = seq(0, 100, by = 1)
)

# Create data for new supply curve
supply2 <- data.frame(
  Quantity = seq(20, 120, by = 1),
  Price = seq(0, 100, by = 1)
)

# Create plot
juniors_oferta_demanda <- ggplot() +
  geom_line(data = demand, aes(x = Quantity, y = Price), color = "blue") +
  geom_line(data = supply1, aes(x = Quantity, y = Price), color = "red") +
  geom_line(data = supply2, aes(x = Quantity, y = Price), color = "red", linetype = "dashed") + # Make this line dashed
  labs(x = "Cantidad", y = "Precio", title = "Oferta (rojo) y demanda (azul) en Junior's Restaurant") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    text = element_text(size = 12, face = "bold"),
    axis.text.x = element_blank(), # Remove x-axis labels
    axis.text.y = element_blank() # Remove y-axis labels
  )

ggsave("./assets/juniors_oferta_demanda.jpg", juniors_oferta_demanda, width = 10, height = 5, dpi = 600)

# FPP por escasez de queso crema

# Create the first dataframe for "Antes"
df_before <- data.frame(
  días_por_semana = c(0, 1),
  cheesecakes = c(5, 0),
  period = "Después de cierre por pandemia"
)

# Create the second dataframe for "Después"
df_after <- data.frame(
  días_por_semana = c(0, 7),
  cheesecakes = c(30, 0), # Increase the cheesecakes values
  period = "Antes de cierre por pandemia"
)

# Combine the dataframes
df_juniors <- rbind(df_before, df_after)

# Plot df_juniors
juniors_plot <- ggplot() +
  geom_area(data = df_juniors[df_juniors$period == "Antes de cierre por pandemia", ], aes(x = días_por_semana, y = cheesecakes, fill = period), alpha = 0.5) +
  geom_area(data = df_juniors[df_juniors$period == "Después de cierre por pandemia", ], aes(x = días_por_semana, y = cheesecakes, fill = period), alpha = 0.7) +
  ggtitle("FPP de Junior's Restaurants por cierre durante la pandemia") +
  labs(
    x = "Días por semana", y = "Cheesecakes"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    text = element_text(size = 12, face = "bold"),
    axis.text.x = element_blank(), # Remove x-axis labels
    axis.text.y = element_blank() # Remove y-axis labels
  ) +
  scale_alpha_identity() +
  scale_fill_manual(values = c("Después de cierre por pandemia" = "#0000ffcb", "Antes de cierre por pandemia" = "#ff0000")) # Change the colors

# Save the plot
ggsave("./assets/juniors_plot.jpg", juniors_plot, width = 10, height = 5, dpi = 600)

# Curva de oferta y demanda con nueva oferta a la izquierda

# Create data for demand curve
demand <- data.frame(
  Quantity = seq(0, 100, by = 1),
  Price = 100 - seq(0, 100, by = 1)
)

# Create data for original supply curve
supply1 <- data.frame(
  Quantity = seq(0, 100, by = 1),
  Price = seq(0, 100, by = 1)
)

# Create data for new supply curve
supply2 <- data.frame(
  Quantity = seq(20, 120, by = 1),
  Price = seq(0, 100, by = 1)
)

# Create plot
juniors_oferta_demanda <- ggplot() +
  geom_line(data = demand, aes(x = Quantity, y = Price), color = "blue") +
  geom_line(data = supply1, aes(x = Quantity, y = Price), color = "red", linetype = "dashed") +
  geom_line(data = supply2, aes(x = Quantity, y = Price), color = "red") + # Make this line dashed
  labs(x = "Cantidad", y = "Precio", title = "Oferta (rojo) y demanda (azul) en Junior's Restaurant") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    text = element_text(size = 12, face = "bold"),
    axis.text.x = element_blank(), # Remove x-axis labels
    axis.text.y = element_blank() # Remove y-axis labels
  )

ggsave("./assets/juniors_oferta_demanda.jpg", juniors_oferta_demanda, width = 10, height = 5, dpi = 600)

# * FPP por aumento en los precios de los alimentos (costo de materia prima)

# Create the first dataframe for "Antes"
df_before <- data.frame(
  días_por_semana = c(0, 3),
  cheesecakes = c(15, 0),
  period = "Después de aumento en precios de alimentos"
)

# Create the second dataframe for "Después"
df_after <- data.frame(
  días_por_semana = c(0, 7),
  cheesecakes = c(30, 0), # Increase the cheesecakes values
  period = "Antes de aumento en precios de alimentos"
)

# Combine the dataframes
df_juniors <- rbind(df_before, df_after)

# Plot df_juniors
juniors_plot <- ggplot() +
  geom_area(data = df_juniors[df_juniors$period == "Antes de aumento en precios de alimentos", ], aes(x = días_por_semana, y = cheesecakes, fill = period), alpha = 0.5) +
  geom_area(data = df_juniors[df_juniors$period == "Después de aumento en precios de alimentos", ], aes(x = días_por_semana, y = cheesecakes, fill = period), alpha = 0.7) +
  ggtitle("FPP de Junior's Restaurants por aumento en precios de alimentos (materia prima)") +
  labs(
    x = "Costo unitario de materia prima", y = "Cheesecakes"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    text = element_text(size = 12, face = "bold"),
    axis.text.x = element_blank(), # Remove x-axis labels
    axis.text.y = element_blank() # Remove y-axis labels
  ) +
  scale_alpha_identity() +
  scale_fill_manual(values = c("Después de aumento en precios de alimentos" = "#0000ffcb", "Antes de aumento en precios de alimentos" = "#ff0000")) # Change the colors

# Save the plot
ggsave("./assets/juniors_plot.jpg", juniors_plot, width = 10, height = 5, dpi = 600)

# Curva de oferta y demanda con nueva demanda a la derecha

# Create data for demand curve
demand <- data.frame(
  Quantity = seq(0, 100, by = 1),
  Price = 100 - seq(0, 100, by = 1)
)

# Create data for original supply curve
supply1 <- data.frame(
  Quantity = seq(0, 100, by = 1),
  Price = seq(0, 100, by = 1)
)

# Create data for new demand curve
demand2 <- data.frame(
  Quantity = seq(0, 100, by = 1),
  Price = 100 - seq(0, 100, by = 1) + 20
)

# Create plot
juniors_oferta_demanda <- ggplot() +
  geom_line(data = demand, aes(x = Quantity, y = Price), color = "blue") +
  geom_line(data = supply1, aes(x = Quantity, y = Price), color = "red") +
  geom_line(data = demand2, aes(x = Quantity, y = Price), color = "blue", linetype = "dashed") + # Make this line dashed
  labs(x = "Cantidad", y = "Precio", title = "Oferta (rojo) y demanda (azul) en Junior's Restaurant") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    text = element_text(size = 12, face = "bold"),
    axis.text.x = element_blank(), # Remove x-axis labels
    axis.text.y = element_blank() # Remove y-axis labels
  )

ggsave("./assets/juniors_oferta_demanda.jpg", juniors_oferta_demanda, width = 10, height = 5, dpi = 600)

# * PARTE 3 -------------------------------------------------------------------

# * Nueva ley de salario mínimo

# La recientemente implementada ley de pago mínimo del Concejo Municipal de
# Seattle para trabajadores que laboran manejando entregas a través de
# aplicaciones como DoorDash, Uber Eats e Instacart está perjudicando a los
# mismos trabajadores a los que pretendía ayudar. En 2022, el Consejo Municipal
# de Seattle promulgó una ley  única en su tipo que tenía como objetivo
# garantizar que los conductores de entrega basados en aplicaciones ganen un
# salario mínimo más propinas y compensación por gastos. En la práctica, esto ha
# llevado a empresas como DoorDash e Instacart a pagar a sus conductores de
# entrega contratados de forma independiente $26 o más por hora para cumplir con
# la regulación y cubrir sus costos. Esa cantidad está muy por encima del
# salario mínimo regular de la ciudad de Seattle de $19.97 por hora y ha
# obligado a esas empresas a trasladar algunos de esos costos a los consumidores
# que realizan pedidos. Si bien los "Dashers" de la compañía ganan más al
# realizar entregas, eso se produce a costa del volumen de pedidos, según
# DoorDash. DoorDash dijo que sus datos muestran una "caída sin precedentes en
# el volumen de pedidos" desde que entró en vigor la ordenanza de Seattle el mes
# pasado. Dijo que en las dos semanas posteriores al lanzamiento de los cambios,
# los consumidores realizaron 30.000 pedidos menos en el mercado DoorDash y
# agregó que "esperamos que esta pérdida de volumen se agrave aún más con el
# tiempo".

# Create the dataframe
df <- data.frame(
  wage = c(0, 40),
  demand_before = c(10000, 2000),
  supply_before = c(0, 10000),
  demand_after = c(8000, 0),
  supply_after = c(2000, 12000)
)

# Plot the data
part3 <- ggplot(df, aes(wage)) +
  geom_line(aes(y = demand_before), color = "blue") +
  geom_line(aes(y = supply_before), color = "red") +
  geom_line(aes(y = demand_after), color = "blue", linetype = "dashed") +
  geom_line(aes(y = supply_after), color = "red", linetype = "dashed") +
  labs(
    x = "Salario ($ por hora)", y = "Número de conductores",
    title = "Impacto de la ley de salario mínimo en el mercado de repartidores en apps",
    subtitle = "Las líneas apuntadas representan el mercado después de la ley"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"), # Bold title
    plot.subtitle = element_text(face = "bold"), # Bold subtitle
    axis.title = element_text(face = "bold"), # Bold axis titles
    axis.text = element_blank() # Remove axis digits
  )

# Save the plot
ggsave("./assets/part3.jpg", part3, width = 10, height = 5, dpi = 600)
