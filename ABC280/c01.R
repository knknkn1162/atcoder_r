options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

S <- readLines(conn, n=1)
Ts <- readLines(conn, n=1)

tibble(s = S |> str_c("-") |> str_split_1(""), t = Ts |> str_split_1("")) |>
  mutate(idx = row_number()) |>
  filter(s != t) |>
  slice_head(n=1) |>
  pull(idx) |>
  cat()