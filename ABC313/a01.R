options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
P <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()


P |>
  as_tibble() |>
  mutate(diff = max(value)-value) |>
  filter(diff == first(diff)) |>
  mutate(n = n()) |>
  head(1) |>
  (\(tb) if_else(tb$n == 1 & tb$diff==0, 0, tb$diff+1))() |>
  cat()