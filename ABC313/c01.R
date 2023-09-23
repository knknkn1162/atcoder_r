options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

A |>
  as_tibble() |>
  arrange(-value) |>
  mutate(v = sum(value)%/%n(), v = v + c(rep(1, sum(value)%%n()),rep(0,N))[1:N]) |>
  mutate(diff = bignum::biginteger(abs(value-v))) |>
  summarize(sum = sum(diff)/2) |>
  pull(sum) |>
  cat()