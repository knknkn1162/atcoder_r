# tidyverse, bignum
#conn <- file("stdin", open="r")
conn <- stdin()
options(scipen=100)
gcd <- function(x,y) {
  r <- x%%y;
  return(ifelse(r != 0, Recall(y, r), y))
}

inputs <- readLines(conn, n=1) |>
  str_split_1(" ") |> parse_number()
inputs2 <- inputs |>
  as_biginteger() |>
  sort() |>
  (\(x) x %/% as_biginteger(gcd(x[2],x[1])))()

1:1000 |>
  accumulate(\(acc,nxt) acc |> (\(x) c(min(x),max(x)-min(x)))() |> sort(), .init=inputs2) |>
  unlist() |>
  matrix(ncol=2, byrow=TRUE) |>
  as_tibble() |>
  mutate(idx = row_number()-1) |>
  filter(V1 == 1) |>
  first() |>
  (\(x) (as_biginteger(x$V2) - 1) + as_biginteger(x$idx))() |>
  cat()