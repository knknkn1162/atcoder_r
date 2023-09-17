# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; M <- inputs[2]

A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
B <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

dummy <- A |>
  as_tibble() |>
  mutate(label = "A") |>
  bind_rows(
    B |> as_tibble() |> mutate(label = "B") 
  ) |>
  arrange(value) |>
  mutate(idx = row_number()) |>
  group_by(label) |>
  group_walk(\(stb,key) stb |>
    pull(idx) |>
    str_flatten(" ") |>
    cat(sep="\n")
  )