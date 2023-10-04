# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
H <- inputs[1]; W <- inputs[2]

S <- readLines(conn, n=H)

S |>
  str_split("") |>
  list_c() |>
  as_tibble() |>
  filter(value == "#") |>
  nrow() |>
  cat()