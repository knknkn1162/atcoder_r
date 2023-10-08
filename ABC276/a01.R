# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

S <- readLines(conn, n=1)

S |>
  str_split_1("") |>
  as_tibble() |>
  mutate(idx = row_number()) |>
  add_row(value = 'a', idx = -1, .before=0) |>
  filter(value == 'a') |>
  slice_tail(n=1) |>
  pull(idx) |>
  cat()