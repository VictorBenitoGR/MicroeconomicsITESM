# *** MICROECONOMÍA - LABORATORIO 2 ***

source("./src/df_a_imagen.R") # Función hecha por mí para hacer DFs a imagen

# A continuación se presentan los siguientes datos de oferta y demanda del
# “Plan Básico” de Netflix en México:

# Precio de Subscripción del Plan Básico
precio_basico <- c(159, 149, 139, 129, 119, 109, 99)

# Suscripciones demandadas (millones)
demanda <- c(5, 5.5, 6, 6.5, 7, 7.5, 8) * 1e6

# Suscripciones ofrecidas (millones)
oferta <- c(8, 7.5, 7, 6.5, 6, 5.5, 5) * 1e6

# df_1
df_1 <- data.frame(precio_basico, demanda, oferta)

View(df_1)

# * ¿Cuál es el precio y cantidad de equilibrio?
# * Menciónalo y muéstralo gráficamente.

library(ggplot2)

# Gráfico de la demanda y oferta
df_1_plot_1 <- ggplot(df_1, aes(x = precio_basico)) +
  geom_line(aes(y = demanda), color = "blue") +
  geom_line(aes(y = oferta), color = "red") +
  labs(
    title = "Demanda y Oferta del Plan Básico de Netflix en México",
    x = "Precio de Subscripción",
    y = "Suscripciones (millones)"
  ) +
  theme_minimal()

ggsave("assets/laboratorio2/df_1_plot_1.jpg",
  plot = df_1_plot_1, width = 6, height = 4, units = "in"
)

# Calculamos el precio y cantidad de equilibrio
precio_equilibrio <- df_1$precio_basico[
  which.min(abs(df_1$demanda - df_1$oferta))
]
precio_equilibrio # $129
cantidad_equilibrio <- df_1$demanda[
  which.min(abs(df_1$demanda - df_1$oferta))
]
cantidad_equilibrio # 6,500,000

# Gráfico de la demanda y oferta con el equilibrio
df_1_plot_2 <- ggplot(df_1, aes(x = precio_basico)) +
  geom_line(aes(y = demanda), color = "blue") +
  geom_line(aes(y = oferta), color = "red") +
  geom_vline(xintercept = precio_equilibrio, linetype = "dashed") +
  geom_hline(yintercept = cantidad_equilibrio, linetype = "dashed") +
  geom_point(aes(x = precio_equilibrio, y = cantidad_equilibrio),
    color = "green", size = 3
  ) +
  labs(
    title = "Demanda y Oferta del Plan Básico de Netflix en México",
    x = "Precio de Subscripción",
    y = "Suscripciones (millones)"
  ) +
  theme_minimal()

ggsave("assets/laboratorio2/df_1_plot_2.jpg",
  plot = df_1_plot_2, width = 6, height = 4, units = "in"
)

# * El gobierno aplicará un IVA del 16% del precio de equilibrio, ¿cuál es el
# * precio y cantidad de equilibrio nuevos? Menciónalos y muéstralos
# * gráficamente.

# Calculamos el precio y cantidad de equilibrio con el IVA
precio_equilibrio_iva <- precio_equilibrio * 1.16
precio_equilibrio_iva # $149.64
cantidad_equilibrio_iva <- cantidad_equilibrio
cantidad_equilibrio_iva # 6.5M, aunque cambia su efecto no ocurre inmediatamente

# Gráfico de la demanda y oferta con el equilibrio con el IVA

df_1_plot_3 <- ggplot(df_1, aes(x = precio_basico)) +
  geom_line(aes(y = demanda), color = "blue") +
  geom_line(aes(y = oferta), color = "red") +
  geom_vline(xintercept = precio_equilibrio_iva, linetype = "dashed") +
  geom_hline(yintercept = cantidad_equilibrio_iva, linetype = "dashed") +
  geom_point(aes(x = precio_equilibrio_iva, y = cantidad_equilibrio_iva),
    color = "green", size = 3
  ) +
  labs(
    title = "Demanda y Oferta del Plan Básico de Netflix en México",
    x = "Precio de Subscripción",
    y = "Suscripciones (millones)"
  ) +
  theme_minimal()

ggsave("assets/laboratorio2/df_1_plot_3.jpg",
  plot = df_1_plot_3, width = 6, height = 4, units = "in"
)

# * Muestra el procedimiento y calcula:
# * Excedente del consumidor y productor antes del impuesto

# Excedente del consumidor y productor antes del impuesto
excedente_consumidor_antes <- sum(
  (df_1$demanda[-length(df_1$demanda)] + df_1$demanda[-1]) / 2 *
    diff(df_1$precio_basico)[df_1$precio_basico[-1] >= precio_equilibrio]
)
excedente_productor_antes <- sum(
  (df_1$oferta[-length(df_1$oferta)] + df_1$oferta[-1]) / 2 *
    diff(df_1$precio_basico)[df_1$precio_basico[-1] <= precio_equilibrio]
)

excedente_consumidor_antes # -$390,000,000
excedente_productor_antes # -$390,000,000

# * Excedente del consumidor y productor después del impuesto
excedente_consumidor_despues <- sum(
  (df_1$demanda[-length(df_1$demanda)] + df_1$demanda[-1]) / 2 *
    diff(df_1$precio_basico)[df_1$precio_basico[-1] >= precio_equilibrio_iva]
)
excedente_productor_despues <- sum(
  (df_1$oferta[-length(df_1$oferta)] + df_1$oferta[-1]) / 2 *
    diff(df_1$precio_basico)[df_1$precio_basico[-1] <= precio_equilibrio_iva]
)

excedente_consumidor_despues # $0
excedente_productor_despues # -$390,000,000

# * La pérdida irrecuperable

perdida_irrecuperable <- (
  excedente_consumidor_antes + excedente_productor_antes
) - (excedente_consumidor_despues + excedente_productor_despues)

perdida_irrecuperable # -$390,000,000

# * La ganancia total del gobierno por el impuesto

ganancia_gobierno <- (precio_equilibrio_iva - precio_equilibrio) *
  sum(df_1$demanda[df_1$precio_basico <= precio_equilibrio_iva])

ganancia_gobierno # $835,920,000

# * Con base en la respuesta anterior, ¿quién pagó la mayor parte del
# * impuesto? ¿cuáles son los factores que determinan el impacto final del
# * impuesto en el mercado? Menciónalos y explícalos.

# La mayor parte del impuesto la pagaron los consumidores, ya que el excedente
# del consumidor disminuyó en $390,000,000, mientras que el excedente del
# productor se mantuvo constante. Los factores que determinan el impacto final
# del impuesto en el mercado son la elasticidad precio de la demanda y la
# elasticidad precio de la oferta. Si la demanda es inelástica y la oferta es
# elástica, los consumidores pagarán la mayor parte del impuesto. Por otro lado,
# si la demanda es elástica y la oferta es inelástica, los productores pagarán
# la mayor parte del impuesto.

# * Con base en las respuestas anteriores, obtén la elasticidad precio
# * de la demanda (utiliza la fórmula de elasticidad arco). ¿Qué información se
# * puede concluir a partir de esta elasticidad?

# Elasticidad precio de la demanda
elasticidad_precio_demanda <- (mean(
  diff(df_1$demanda)
) / mean(
  df_1$demanda
)) / (mean(
  diff(df_1$precio_basico)
) / mean(
  df_1$precio_basico
))

elasticidad_precio_demanda # -0.9923077

# La elasticidad precio de la demanda es -0.9923077, lo que indica que la
# demanda es elástica. Por lo tanto, los consumidores son sensibles a cambios en
# el precio del Plan Básico de Netflix.

# (4 pts) Según esta cita de este artículo: En el plan más básico de su
# servicio, absorberán la mitad del IVA, por lo que el usuario solo deberá pagar
# 8% extra, es decir 10 pesos más al costo original, agregó el vocero de
# Netflix”, ¿por qué a diferencia de sus demás planes, el Plan Básico fue el
# único en el que la empresa decidió absorber la mitad del IVA? ¿qué tipo de
# bien considera Netflix que es su plan básico? ¿elástico o inelástico?
# Justifica tu respuesta.}

# La empresa decidió absorber la mitad del IVA en el Plan Básico porque
# considera que es un bien elástico, es decir, que la demanda es sensible a
# cambios en el precio, es decir, asumieron la mitad del IVA para no perder
# suscriptores y mantener su participación en el mercado, aunque también sería
# por ello interesante ponderar la relación que pueda tener la sensibilidad del
# precio de sus acciones, más allá del beneficio económico implícito de las
# transacciones en sí.


# *** IV La siguiente tabla muestra la producción del negocio de pizzas de
# *** Mario. Mario debe pagar una renta de $100 al día por cada horno que renta
# *** y $75 al día a cada trabajador que contrata.

# * Obtén el Costo Total Medio de cada tamaño de planta (muestra tu
# * procedimiento) e identifica y encircula el CTMe mínimo para cada
# * tamaño de planta.

n_hornos_planta_1 <- 1
n_hornos_planta_2 <- 2
n_hornos_planta_3 <- 3
n_hornos_planta_4 <- 4
costo_horno <- 100
costo_trabajador <- 75

trabajadores <- c(1, 2, 3, 4)
planta_1 <- c(4, 8, 11, 13)
costo_total_medio_1 <- c(NA, NA, NA, NA)
planta_2 <- c(8, 12, 15, 17)
costo_total_medio_2 <- c(NA, NA, NA, NA)
planta_3 <- c(11, 15, 18, 20)
costo_total_medio_3 <- c(NA, NA, NA, NA)
planta_4 <- c(13, 17, 20, 22)
costo_total_medio_4 <- c(NA, NA, NA, NA)

produccion <- data.frame(
  trabajadores, planta_1, costo_total_medio_1,
  planta_2, costo_total_medio_2,
  planta_3, costo_total_medio_3,
  planta_4, costo_total_medio_4
)

View(produccion)

# Obtenemos el Costo Total Medio de cada tamaño de planta y sus n° de hornos
for (i in 1:4) {
  produccion$costo_total_medio_1[i] <- (
    n_hornos_planta_1 * costo_horno + trabajadores[i] * costo_trabajador
  ) / planta_1[i]
  produccion$costo_total_medio_2[i] <- (
    n_hornos_planta_2 * costo_horno + trabajadores[i] * costo_trabajador
  ) / planta_2[i]
  produccion$costo_total_medio_3[i] <- (
    n_hornos_planta_3 * costo_horno + trabajadores[i] * costo_trabajador
  ) / planta_3[i]
  produccion$costo_total_medio_4[i] <- (
    n_hornos_planta_4 * costo_horno + trabajadores[i] * costo_trabajador
  ) / planta_4[i]
}

View(produccion)

df_a_imagen(produccion, ancho = 4800, alto = 700)


# *** VII. Una empresa en competencia perfecta enfrenta los siguientes costos.
# *** Si el precio de mercado es $15:

q <- c(0, 1, 2, 3, 4, 5)
CT <- c(10, 21, 30, 41, 54, 69)
precio_de_mercado <- 15

df_vii <- data.frame(q, CT)

# * ¿Cuál es la cantidad y precio que maximizan las ganancias?
# Calcular los ingresos totales
df_vii$IT <- df_vii$q * precio_de_mercado

# Calcular las ganancias
df_vii$ganancias <- df_vii$IT - df_vii$CT

View(df_vii)

# Encontrar la cantidad que maximiza las ganancias
ganancia_maxima <- df_vii[df_vii$ganancias == max(df_vii$ganancias), ]

# Mostrar la cantidad y el precio que maximizan las ganancias
ganancia_maxima # El mejor es q = 4 y 5, aunque en la práctica es el 4.

# * ¿De cuánto son las ganancias en el corto plazo?
ganancias_corto_plazo <- df_vii$ganancias[df_vii$q == 2]

ganancias_corto_plazo # $0

# * A partir de la respuesta anterior, en el largo plazo, ¿entran o salen
# * empresas? ¿o se queda todo igual?

# Al ser ganancias en 0 se mantendrían igual, pero en el largo plazo son
# positivas por lo que entrarían empresas.

df_a_imagen(df_vii, ancho = 1000, alto = 700)
