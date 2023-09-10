options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
input <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- input[1]; M <- input[2]
C <- readLines(conn, n=1) |> str_split_1(" ")
D <- readLines(conn, n=1) |> str_split_1(" ")
P <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
tibble(dish = C) |>
  left_join(tibble(dish = D, price = P[-1])) |>
  replace_na(list(price=P[1])) |>
  summarize(sum(price)) |>
  pull() |>
  cat()