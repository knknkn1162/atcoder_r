# slider
options(scipen=100)
#conn <- file("stdin", open="r")
conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
A <- readLines(conn, n=1) |> str_split_1(" ")

A %in% c("and", "not", "that", "the", "you") |>
  any() |>
  (\(x) if_else(x, "Yes", "No"))() |>
  cat()