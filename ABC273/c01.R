# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

A |>
  as_tibble() |>
  arrange(desc(value)) |>
  mutate(v = consecutive_id(value)-1) |>
  summarize(n = n(), .by=v) |>
  complete(v=0:(N-1), fill=list(n=0)) |>
  pull(n) |>
  cat(sep="\n")