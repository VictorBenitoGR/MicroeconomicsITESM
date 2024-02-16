# MicroeconomicsITESM
I will post here anything relevant I've done in my Microeconomics class at Tecnologico de Monterrey.

## Production-Possibility Frontier (PPF) with margin cost
This illustrates the maximum possible output combinations of two goods or services an economy can achieve, given its resources and technology. It represents the trade-off between producing one good over another, showing the opportunity cost of choosing one option over the other.

The concept of marginal cost comes into play when analyzing the PPF. Marginal cost refers to the additional cost incurred by producing one more unit of a good. As an economy moves along the PPF to produce more of one good, the marginal cost typically increases. This is because resources are often specialized, and allocating more resources to a particular good means diverting them from another, causing a decrease in efficiency and an increase in cost.

### Example: 
Imagine you are in the middle of nowhere and you can only hunt rabbits or pick blackberries to feed yourself.

| Rabbits | Blackberries |
|---------|--------------|
| 5       | 0            |
| 4       | 100          |
| 3       | 180          |
| 2       | 240          |
| 1       | 280          |
| 0       | 300          |

```r
# * Packages
library(dplyr) # Data manipulation
library(ggplot2) # Data visualization
library(hrbrthemes) # Custom themes for ggplot2
```

```r
# * Create the DF with the given info
data <- data.frame(
  rabbits = c(5, 4, 3, 2, 1, 0),
  blackberries = c(0, 100, 180, 240, 280, 300)
)
```

```r
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
```

```r
# * Obtain the opportunity cost of catching rabbits at
# * each point on the graph (marginal cost).
data$marginal_cost <- c(NA, diff(data$blackberries) / diff(data$rabbits))
print(data)
```

```r
# * Plot | Production-Possibility Frontier (PPF) with marginal cost
ppf_marginal_cost <- ggplot(data, aes(x = rabbits, y = blackberries)) +
  geom_area(fill = "#69b3a2", alpha = 0.4) +
  geom_line(color = "#ff0000", size = 2, alpha = 0.9, linetype = 1) +
  geom_text(aes(label = marginal_cost), vjust = 0.3, hjust = -1.5, size = 5) +
  annotate(
    "text",
    label = "Inefficient",
    x = 2, y = 100, size = 5, colour = "#000000"
  ) +
  annotate(
    "text",
    label = "Impossible",
    x = 4, y = 250, size = 5, colour = "#000000"
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
```

![PPF with margin cost](./assets/ppf_marginal_cost.jpg)