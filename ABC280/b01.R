# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
S <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

S |>
  as_tibble() |>
  mutate(diff = value - lag(value, default=0)) |>
  pull(diff) |>
  cat()