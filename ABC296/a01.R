options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()
str <- readLines(conn, n=1)

rep("MF",51) |>
  str_flatten("") |> 
  str_detect(str) |>
  (\(x) if_else(x >= 1, "Yes", "No"))() |>
  cat()