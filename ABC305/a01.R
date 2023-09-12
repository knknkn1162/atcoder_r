options(scipen=100)
#conn <- file("stdin", open="r")
conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()

cat(round(N / 5) * 5)