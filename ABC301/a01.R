# tidyverse
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()

strs <- readLines(conn, n=1)
strs |>
  str_split_1("") |>
  as_tibble() |>
  mutate(idx = row_number()) |>
  group_by(value) |>
  summarize(cnt = n(), last_idx = last(idx))  |>
  arrange(desc(cnt), last_idx) |>
  first() |>
  pull(value) |>
  cat()