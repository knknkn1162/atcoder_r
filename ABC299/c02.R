# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()
strs <- readLines(conn, n=1)

strs |>
  str_split_1("-") |>
  str_length() |>
  (\(x) if_else(all(x == 0) | length(x) <= 1, -1, max(x)))() |>
  cat()