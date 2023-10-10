# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
H <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

H |>
  as_tibble() |>
  mutate(idx = row_number()) |>
  filter(value == max(value)) |>
  pull(idx) |>
  cat()