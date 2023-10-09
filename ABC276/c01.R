# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

pivot <- A |>
  as_tibble() |>
  mutate(diff = lead(value) - value, idx = row_number()) |>
  filter(diff < 0) |>
  slice_tail(n=1)

new <- A[pivot$idx:length(A)] |> as_tibble() |> filter(value < pivot$value) |> pull(value) |> tail(1)
latter <- A[pivot$idx:length(A)] |> as_tibble() |> filter(value != new) |> arrange(desc(value)) |> pull(value)

c(A[1:pivot$idx-1], new, latter) |>
  cat()