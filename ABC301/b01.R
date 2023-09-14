# tidyverse
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()

A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

A |>
  as_tibble() |>
  mutate(nxt = lead(value)) |>
  drop_na() |>
  rowwise() |>
  mutate(gap = list(value:nxt)) |>
  pull(gap) |>
  unlist() |>
  # remove overlap
  as_tibble() |>
  group_by(consecutive_id(value)) |>
  summarize(res = first(value)) |>
  pull(res) |>
  cat()