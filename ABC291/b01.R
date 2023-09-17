# tidyverse, sets
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
X <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

X |>
  as_tibble() |>
  arrange(value) |>
  slice((N+1):(4*N)) |>
  pull() |>
  mean() |>
  cat()