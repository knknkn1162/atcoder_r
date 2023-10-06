# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ")

str <- inputs |>
  str_pad(width=2, pad='0') |>
  str_flatten("")


expand_grid(h=0:23, m=0:59) |>
  mutate(s = str_c(str_pad(h, width=2, pad='0'), str_pad(m, width=2, pad='0'))) |>
  mutate(rot = s |> str_split("")) |>
  unnest_wider(rot, names_sep="") |>
  mutate(rot = str_c(rot1, rot3, rot2, rot4)) |>
  (\(tb) semi_join(tb, tb, join_by(s == rot)))() |>
  # guard
  (\(tb) add_row(tb, tibble_row(h=0,m=0,s='2400')))() |>
  filter(s >= str) |>
  first() |>
  select(h,m) |>
  unlist() |>
  cat()