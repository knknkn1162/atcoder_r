# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

S <- readLines(conn, n=1)

S |>
  str_split_1("") |>
  as_tibble() |>
  group_by(ntile(n=str_length(S)/2)) |>
  summarize(str = value |> rev() |> str_flatten("")) |>
  pull(str) |>
  str_flatten("") |>
  cat()