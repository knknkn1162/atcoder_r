# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

DIVISOR <- 998244353
inputs <- 
  readLines(conn, n=1) |>
  str_split_1(" ") |>
  bignum::as_biginteger() %% DIVISOR

former <- inputs[1:3] |>
  reduce(\(acc,nxt)  (acc*nxt) %% DIVISOR ) + DIVISOR
latter <- inputs[4:6] |>
  reduce(\(acc,nxt) (acc*nxt) %% DIVISOR)

(former - latter) %% DIVISOR |>
  cat()