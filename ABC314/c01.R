options(scipen=100)
#conn <- file("stdin", open="r")
conn <- stdin()

inputs <- readLines(conn, n=1) |> parse_number()
N <- inputs[1]; M <- inputs[2]
S <- readLines(conn, n=1)
C <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

# manipulate index
vec <- tibble(idx = 1:N, color=C) |>
  nest(.by=c(color)) |>
  rowwise() |>
  mutate(data2 = list(data |> mutate(w = row_number()%%n()) |> arrange(w) |> mutate(bidx=sort(idx)))) |>
  pull(data2) |>
  list_rbind() |>
  arrange(bidx) |>
  pull(idx)

S |>
  str_split_1("") |>
  (\(s) s[vec])() |>
  str_flatten("") |>
  cat()