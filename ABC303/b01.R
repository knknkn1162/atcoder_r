# tidyverse, utils, slider
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; M <- inputs[2]
lines <- read.table(conn)

lines |>
  t() |>
  as_tibble() |>
  slide(\(x) x |> t(), .before = 1, .complete=TRUE) |>
  map(\(x) x |> as.data.frame()) |>
  list_rbind() |>
  rowwise() |>
  mutate(V3 = min(V1,V2), V4 = max(V1,V2)) |>
  group_by(V3, V4) |>
  n_groups() |>
  (\(x) (N*(N-1)/2 - x))() |>
  cat()