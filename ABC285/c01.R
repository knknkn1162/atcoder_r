options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

S <- readLines(conn, n=1)
len <- str_length(S)
S |>
  str_split_1("") |>
  as_tibble() |>
  mutate(idx = len-row_number()) |>
  inner_join(tibble(value=LETTERS, v2=1:26)) |>
  mutate(num = bignum::biginteger(26^idx), s = num * v2) |>
  pull(s) |>
  sum() |>
  cat()