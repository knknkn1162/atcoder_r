# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
X <- inputs[1]; Y <- inputs[2]; Z <- inputs[3]

res <- 1e+8

if(X * Y < 0) {
  res <- abs(X)
} else if(abs(X) < abs(Y)) {
    res <- abs(X)
} else if(X * Z < 0) {
  res <- abs(Z)*2 + abs(X)
} else if(abs(Z) < abs(Y)) {
  res <- abs(X)
} else {
  res <- -1
}

res |>
  cat()