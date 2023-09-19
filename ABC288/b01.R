# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; K <- inputs[2]
S <- readLines(conn, n=N)

S[1:K] |>
  sort() |>
  cat(sep="\n")