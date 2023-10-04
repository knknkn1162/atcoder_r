# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()

clst <-
  N %% 1:9 |>
  as_tibble() |>
  mutate(idx = row_number(), dby = N/idx) |>
  filter(value == 0)

res <- c()
for (num in 0:N) {
  res[num+1] <- clst |>
    filter(num %% dby == 0) |>
    first() |>
    pull(idx) |>
    (\(x) if_else(is.na(x), "-", as.character(x)))()
}
res |>
  str_flatten() |>
  cat()