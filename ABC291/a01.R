# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

S <- readLines(conn, n=1)

S |>
  str_locate("[A-Z]") |>
  _[[1]] |>
  cat()