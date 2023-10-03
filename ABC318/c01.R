# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; D <- inputs[2]; P <- inputs[3] |> bignum::as_biginteger()

unit <- P/D
Fs <- readLines(conn, n=1) |> str_split_1(" ") |>
  bignum::as_biginteger() |>
  as_tibble() |>
  arrange(value) |>
  mutate(cum = cumsum(value))

tickets <- Fs |>
  filter(value > unit) |>
  nrow() |>
  (\(x) (x-x%%D) / D)()

cand1 <- P*tickets + (Fs |> slice((N-tickets*D) ) |> pull(cum) |> sum())
cand2 <- P*(tickets+1) + (Fs |> slice(max(0,(N-(tickets+1)*D)) ) |> pull(cum) |> sum())

c(cand1, cand2) |>
  min() |>
  cat()