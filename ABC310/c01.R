options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()
S <- readLines(conn, n=N) |>
  as_tibble() |>
  rowwise() |>
  mutate(rev = value |> str_split_1("") |> rev() |> str_flatten()) |>
  ungroup() |>
  mutate(str = if_else(value > rev, value, rev)) |>
  summarize(n = n(), .by = str) |>
  nrow() |>
  cat()