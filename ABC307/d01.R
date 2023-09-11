options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()
S <- readLines(conn, n=1)
# TODO: too slow
1:(N/2) |> reduce(\(acc, nxt) str_remove_all(acc, "\\([a-z]*\\)"), .init = S) |>
  cat()