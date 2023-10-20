# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <-  readLines(conn, n=1) |> parse_number()
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

A |>
  as_tibble() |>
  group_by(value%%2) |>
  # pick up 2 even number and 2 odd number
  slice_max(value, n=2) |>
  ungroup() |>
  mutate(idx = row_number()) |>
  (\(tb) cross_join(tb,tb))() |>
  filter(idx.x < idx.y) |>
  mutate(sum = value.x+value.y) |>
  arrange(desc(sum)) |>
  filter(sum %% 2 == 0) |>
  add_row(sum = -1) |>
  head(1) |>
  pull(sum) |>
  cat()