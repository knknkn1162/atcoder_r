# tidyverse, sets
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

ans <- A |>
  as_tibble() |>
  mutate(value = as.integer(value), idx = row_number()) |>
  group_split(idx) |>
  # Too slow..
  reduce(\(acc,nxt) {if(nxt$idx %e% acc) {acc} else {acc + set(nxt$value)}}, .init=set()) |>
  set_symdiff(1:N) |>
  unlist()

cat(length(ans), sep="\n")
cat(ans)