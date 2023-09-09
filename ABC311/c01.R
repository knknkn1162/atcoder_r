# tidyverse, hash
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
tb <- A |>
  as_tibble() |>
  rename(dst = value) |>
  mutate(src = row_number())
# require "hash" library
htable <- tb |>
  (\(x) hash(x$src, x$dst))()

ans <- 1:(2*N+2) |>
  accumulate(\(acc, nxt) htable[[as.character(acc)]], .init=1
  ) |>
  rev() |>
  as_tibble() |>
  filter(row_number() <= N) |>
  group_by(value) |>
  summarize(first(value)) |>
  pull()
cat(length(ans), sep="\n")
cat(ans)