# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

S <- readLines(conn, n=1)
Ts <- readLines(conn, n=1)

S |>
  str_detect(Ts) |>
  if_else("Yes", "No") |>
  cat()