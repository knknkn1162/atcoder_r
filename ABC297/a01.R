options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; D <- inputs[2]
v <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

v |>
  as_tibble() |>
  mutate(prev = lag(value)) |>
  drop_na() |>
  mutate(diff = value - prev) |>
  # guard
  add_row(value = -1, diff = 0) |>
  filter(diff <= D) |>
  slice_head() |>
  pull(value) |>
  cat()