# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; K <- inputs[2]

A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()


c(A[-1:-K], rep(0,min(K,N))) |>
  cat()