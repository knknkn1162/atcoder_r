# tidyverse,utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()
tb <- read.table(conn) |> as_tibble()
idx <- tb |>
  mutate(idx = row_number()) |>
  filter(V2 == min(V2)) |>
  pull(idx)
tb |>
  add_row(tb) |>
  slice(idx:(idx+N-1)) |>
  pull(V1) |>
  cat(sep = "\n")