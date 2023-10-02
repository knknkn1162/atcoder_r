options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; M <- inputs[2]

S <- readLines(conn, n=N) |> str_split("")

S |>
  matrix() |>
  as_tibble() |>
  mutate(idx = row_number()) |>
  rowwise() |>
  mutate(v = list(V1 %in% "o")) |>
  (\(tb) cross_join(tb,tb))() |>
  filter(idx.x < idx.y) |>
  mutate(flag = all(v.x | v.y)) |>
  pull(flag) |>
  sum() |>
  cat()