options(scipen=100)
#conn <- file("stdin", open="r")
conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

A |>
  as_tibble() |>
  mutate(idx = row_number()) |>
  summarize(mid = median(idx), .by = value) |>
  arrange(mid) |>
  pull(value) |>
  cat()