# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <-  readLines(conn, n=1) |> parse_number()

sprintf("%02X", N) |>
  cat()