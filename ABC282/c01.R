options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()
S <- readLines(conn, n=1)

S |>
  str_split_1("") |>
  as_tibble() |>
  mutate(v = cumsum(value == "\"")) |>
  mutate(value2 = if_else(value == "," & v %% 2 == 0, ".", value)) |>
  pull(value2) |>
  str_flatten() |>
  cat()