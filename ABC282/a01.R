options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

K <- readLines(conn, n=1) |> parse_number()
LETTERS[1:K] |>
  str_flatten() |>
  cat()