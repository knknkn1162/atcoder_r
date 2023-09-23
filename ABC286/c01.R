options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; A <- bignum::biginteger(inputs[2]); B <- bignum::biginteger(inputs[3])
S <- readLines(conn, n=1)

tb <- S |>
  str_split_1("") |>
  as_tibble()
res <- bignum::biginteger((A+B)*N)
for(n in 0:(N-1)) {
  m <- tb |>
    mutate(idx = (row_number()-1-n)%%N + 1) |>
    mutate(ridx = N+1-idx) |>
    (\(xtb) inner_join(xtb, xtb, join_by(idx==ridx)))() |>
    filter(value.x != value.y) |>
    nrow()/2
  res <- if_else(res < n*A+m*B, res, n*A+m*B)
}
cat(res)
