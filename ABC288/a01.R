# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- inputs <- readLines(conn, n=1) |> parse_number()
tb <- read.table(conn) |>
  as_tibble()

tb |>
  mutate(v = V1+V2) |>
  pull(v) |>
  cat(sep="\n")