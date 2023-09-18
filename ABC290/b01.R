options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |>parse_number()
N <- inputs[1]; K <- inputs[2]
S <- readLines(conn, n=1)


S |>
  str_split_1("") |>
  as_tibble() |>
  mutate(cnt = cumsum(value == "o")) |>
  mutate(res = if_else(cnt <= K, value, "x")) |>
  pull(res) |>
  str_flatten("") |>
  cat()