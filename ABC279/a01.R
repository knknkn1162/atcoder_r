# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

S <- readLines(conn, n=1)

S |>
  str_split_1("") |>
  as_tibble() |>
  mutate(num = if_else(value == "v", 1, 2)) |>
  pull(num) |>
  sum() |>
  cat()