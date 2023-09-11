options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()
readLines(conn, n=1) |>
  str_split_1(" ") |>
  parse_number() |>
  as_tibble() |>
  mutate(n = ntile(n=N)) |>
  summarize(sum = sum(value), .by = n) |>
  pull(sum) |>
  cat()