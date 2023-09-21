options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; M <- inputs[2]
S <- readLines(conn, n=N)
Ts <- readLines(conn, n=M)

S |>
  str_sub(4,6) %in% Ts |>
  sum() |>
  cat()