options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
input1 <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- input1[1]; P <- input1[2]; Q <- input1[3]
D <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

min(P, Q + min(D)) |>
  cat()