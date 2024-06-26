# * Convertir los dataframes a imágenes

# *** LIBRERÍAS *** -----------------------------------------------------------

# ? Paquetes usados en este script:
# grid            Gráficos Grid
# gridExtra       Gráficos Grid adicionales
# stringr         Manipulación de cadenas de texto

library(grid)
library(gridExtra)
library(stringr)


# *** FUNCIÓN | DF A IMAGEN *** -----------------------------------------------

df_a_imagen <- function(
    df, ancho, alto, n_rows = NULL, n_cols = NULL, res = 300) {
  # Guardar el nombre del dataframe
  df_name <- deparse(substitute(df))

  # Si n_rows o n_cols no están especificados, usar su número real
  if (is.null(n_rows) || n_rows > nrow(df)) {
    n_rows <- nrow(df)
  }
  if (is.null(n_cols)) {
    n_cols <- ncol(df)
  }

  # Calcular el número de filas a mostrar desde arriba y abajo
  top_rows <- ceiling(n_rows / 2)
  bottom_rows <- n_rows - top_rows

  # Seleccionar las filas superior e inferior del dataframe
  df <- rbind(
    df[1:min(top_rows, nrow(df)), 1:n_cols],
    df[(nrow(df) - min(bottom_rows, nrow(df)) + 1):nrow(df), 1:n_cols]
  )

  # Calcular el número máximo de caracteres en cada columna
  max_chars <- apply(df, 2, function(x) max(nchar(as.character(x))))

  # Convertir el dataframe a una matriz
  mat <- as.matrix(df)

  # Crear un objeto tableGrob con anchos de columna ajustados y nombres de fila
  table <- tableGrob(mat,
    rows = rownames(mat), widths = unit(max_chars, "char"),
    theme = ttheme_default(rowhead = list(fg_params = list(fontface = "bold")))
  )

  # Crear la carpeta 'assets' si no existe
  if (!dir.exists("./assets")) {
    dir.create("./assets")
  }

  # Crear el nombre del archivo basado en el nombre del dataframe dado
  filename <- paste0("./assets/", df_name, ".png")

  # Guardar la tabla como una imagen PNG
  png(filename, width = ancho, height = alto, res = res)
  grid.newpage()
  grid.draw(table)
  dev.off()
}

# * Ejemplo de uso
# df_a_imagen(
#   prospectos,
#   ancho = 3100, alto = 1150, n_rows = 10, n_cols = 5
# )
