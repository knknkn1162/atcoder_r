options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1("") |> parse_number()
N <- inputs[1]; W <- inputs[2]
str <- readLines(conn, n=N)

str |>
  str_replace_all("TT", "PC") |>
  cat(sep="\n")