# bignum
options(scipen=100)

conn <- file("stdin", open="r")
#conn <- stdin()
S <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
S |>
  as_tibble() |>
  mutate(v = as_biginteger(2**(row_number()-1)*value)) |>
  summarise(sum = sum(v)) |>
  pull(sum) |>
  cat()