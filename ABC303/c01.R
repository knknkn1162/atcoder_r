options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; M <- inputs[2]; H <- inputs[3]; K <- inputs[4]
S <- readLines(conn, n=1)
items <- read.table(conn) |>
  as_tibble() |>
  mutate(flag = TRUE)
tb <- tibble(label = c("R", "L", "U", "D"), diff.x = c(1, -1, 0, 0), diff.y = c(0, 0, 1, -1))
# TODO: Too slow
S |>
  str_split_1("") |>
  as_tibble() |>
  inner_join(tb, join_by(value == label)) |>
  mutate(x = cumsum(diff.x), y = cumsum(diff.y)) |>
  left_join(items, join_by(x == V1, y == V2)) |>
  mutate(flag = replace_na(flag, FALSE)) |>
  #print() |>
  pull(flag) |>
  accumulate(\(acc, nxt) if_else(nxt, K + max(0, acc-1-K), acc-1),.init = H) |>
  (\(vec) all(head(vec, N) > 0) & (tail(vec,1) >= 0) )() |>
  (\(b) if_else(b, "Yes", "No"))() |>
  cat()