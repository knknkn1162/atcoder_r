options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |>parse_number()
N <- inputs[1]; K <- inputs[2]
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

A |>
  as_tibble() |>
  arrange(value) |>
  distinct() |>
  slice_head(n=K) |>
  pull(value) |>
  (\(x) setdiff(0:K, x))() |>
  min() |>
  cat()