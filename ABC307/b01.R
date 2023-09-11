options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()
strs <- readLines(conn, n=N)

gtools::permutations(N, 2, v = strs) |>
  as_tibble() |>
  mutate(v = str_c(V1,V2)) |>
  rowwise() |>
  mutate(rev = v |> str_split_1("") |> rev() |> str_flatten()) |>
  ungroup() |>
  filter(v == rev) |>
  (\(x) if_else(nrow(x) > 0, "Yes", "No"))() |>
  cat()