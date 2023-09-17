# tidyverse, primes
options(scipen=100)
#conn <- file("stdin", open="r")
conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()

1:(N-1) |>
  # too slow..
  map(\(x) gmp::factorize(x) |>
    as.numeric() |>
    as_tibble() |>
    summarize(n = n()+1,.by = value) |>
    pull(n) |>
    prod()
  ) |>
  unlist() |>
  as_tibble() |>
  mutate(v2 = rev(value), n = value*v2) |>
  summarize(sum = sum(n)) |>
  pull() |>
  cat()