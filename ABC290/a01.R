options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> parse_number()
N <- inputs[1]; M <- inputs[2]
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
B <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()


A |>
  as_tibble() |>
  filter(row_number() %in% B) |>
  pull() |>
  sum() |>
  cat()