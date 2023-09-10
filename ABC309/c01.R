# timeout error
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; K <- inputs[2]
mat <- readLines(conn, n=N) |> str_split(" ") |> map(\(x) parse_number(x))

mat |>
  matrix() |>
  as_tibble() |>
  unnest_wider(V1, names_sep ="") |>
  rename(days = V11, sub = V12) |>
  add_row(days = 0, sub = K) |>
  arrange(desc(days)) |>
  mutate(cum = cumsum(sub)) |>
  filter(cum > K) |>
  slice_head() |>
  pull(days) |>
  (\(x) x + 1)() |>
  cat()