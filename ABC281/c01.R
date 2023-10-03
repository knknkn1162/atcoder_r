options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ")
N <- inputs[1] |> parse_number(); Ts <- inputs[2] |> bignum::as_biginteger()

A <- readLines(conn, n=1) |> str_split_1(" ") |> bignum::as_biginteger()

asum <- A |> sum()
rem <- Ts %% asum

A |>
  as_tibble() |>
  mutate(cum = cumsum(value)) |>
  add_row(value=0, .before=0) |>
  mutate(cum = rem-cumsum(value), idx = row_number()) |>
  filter(cum >= 0) |>
  arrange(cum) |>
  slice_head(n=1) |>
  select(idx, cum) |>
  unlist() |>
  cat()