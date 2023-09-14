# tidyverse, bigint
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |> as_biginteger()
A <- inputs[1]; B <- inputs[2]

ceiling(A/B) |>
  cat()