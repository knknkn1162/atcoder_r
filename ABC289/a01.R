options(scipen=100)
#conn <- file("stdin", open="r")
conn <- stdin()
S <- readLines(conn, n=1)

S |>
  str_split_1("") |>
  parse_number() |>
  as_tibble() |>
  mutate(v2 = 1-value) |>
  pull(v2) |>
  str_flatten("") |>
  cat()