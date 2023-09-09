# https://atcoder.jp/contests/abc311/tasks/abc311_a
conn <- file("stdin", open="r")
#conn <- stdin()
dummy <- readLines(conn, n=1)
S <- readLines(conn, n=1)
S |>
  str_split_1("") |>
  as_tibble() |>
  mutate(idx = row_number()) |>
  group_by(value) |>
  summarize(first = first(idx)) |>
  summarize(max(first)) |>
  pull() |>
  cat()