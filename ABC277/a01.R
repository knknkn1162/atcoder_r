# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; X <- inputs[2]

P <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

P |>
  as_tibble() |>
  mutate(idx = row_number()) |>
  filter(value == X) |>
  pull(idx) |>
  cat()
