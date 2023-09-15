# tidyverse
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
C <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; A <- inputs[2]; B <- inputs[3]

C |>
  as_tibble() |>
  mutate(idx = row_number()) |>
  filter(value == A+B) |>
  pull(idx) |>
  cat()