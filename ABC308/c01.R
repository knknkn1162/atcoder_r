options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()

tb <- readLines(conn, n=N) |>
  str_split(" ") |>
  map(\(x) parse_number(x)) |>
  matrix() |>
  as_tibble() |>
  unnest_wider(V1, names_sep="") |>
  mutate(prob = V11/(V11+V12), idx = row_number()) |>
  arrange(desc(prob), idx) |>
  pull(idx) |>
  cat()