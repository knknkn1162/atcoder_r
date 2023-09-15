# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; card <- inputs[2]
cs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
rs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
tibble(cs, rs) |>
  mutate(idx = row_number()) |>
  mutate(prec = (cs == first(cs))*1 + (cs == card)*2 ) |>
  arrange(desc(prec), desc(rs)) |>
  first() |>
  pull(idx) |>
  cat()