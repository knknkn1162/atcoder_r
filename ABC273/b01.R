# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
X <- inputs[1]; K <- inputs[2] |> as.integer()



0:(K-1) |>
  # xxx5 -> xxx0 in round function, so 
  reduce(\(acc,nxt) round(acc+1,-nxt-1), .init=X) |>
  cat()