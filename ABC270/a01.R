# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
A <- inputs[1]; B <- inputs[2]

bitwOr(A,B) |>
  cat()