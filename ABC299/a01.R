# tidyverse
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()
S <- readLines(conn, n=1) |>
  str_split_1("\\|") |>
  _[2] |>
  str_count("\\*") |>
  (\(x) if_else(x > 0, "in", "out"))() |>
  cat()