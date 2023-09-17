# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
H <- inputs[1]; W <- inputs[2]

strs <- c(".",LETTERS)
tb <- read.table(conn, nrows=H) |>
  as_tibble()

tb |>
  mutate(across(everything(), \(arr) strs[arr+1])) |> 
  rowwise() |>
  mutate(map = str_flatten(c_across(everything()))) |>
  pull(map) |>
  cat(sep = "\n")