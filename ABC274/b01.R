# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
H <- inputs[1]; W <- inputs[2]

C <- readLines(conn, n=H) 

C |>
  str_split("") |>
  matrix() |>
  as_tibble() |>
  unnest_wider(V1, names_sep="") |>
  summarize(across(everything(), \(col) sum(col == "#"))) |>
  unlist() |>
  cat()