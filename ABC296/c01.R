options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; X <- inputs[2]

A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
(A + X) |>
  intersect(A) |>
  length() |>
  (\(x) if_else(x >= 1, "Yes", "No"))() |>
  cat()