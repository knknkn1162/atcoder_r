# https://atcoder.jp/contests/abc311/tasks/abc311_b
conn <- file("stdin", open="r")
#conn <- stdin()
input1 <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- input1[1]; D <- input1[2]
S <- readLines(conn, n=N)
S |>
  str_split_fixed("", n=D) |>
  t() |>
  as_tibble() |>
  mutate(v = if_all(everything(), \(x) x == "o")) |>
  mutate(seq = consecutive_id(v)) |>
  filter(v) |>
  summarize(n = n(), .by = seq) |>
  # guard
  add_row(seq = -1, n = 0) |>
  summarize(max(n)) |>
  pull() |>
  cat()