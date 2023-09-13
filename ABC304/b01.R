# tidyverse
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()

N |>
  as.character() |>
  str_split_1("") |>
  as_tibble() |>
  mutate(ans = if_else(row_number() <= 3, value, "0")) |>
  pull(ans) |>
  str_flatten() |>
  as.numeric() |>
  cat()