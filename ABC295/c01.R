# slider
options(scipen=100)
#conn <- file("stdin", open="r")
conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

A |>
  as_tibble() |>
  arrange(value) |>
  summarize(n = n() %/% 2, .by=value) |>
  summarize(n = sum(n)) |>
  pull(n) |>
  cat()