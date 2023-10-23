# tidyverse, utils
options(scipen=100)
#conn <- file("stdin", open="r")
conn <- stdin()

inputs <-  readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; Q <- inputs[2]

A <- readLines(conn, n=N) |>
  str_split(" ") |>
  map(\(vec) vec[-1] |> parse_number())

Q <- readLines(conn, n=Q) |>
  str_split(" ") |>
  map(\(vec) vec |> parse_number())

Q |>
  matrix() |>
  as_tibble() |>
  unnest_wider(V1, names_sep="") |>
  rowwise() |>
  mutate(ans = A[[V11]][V12]) |>
  pull(ans) |>
  cat(sep="\n")