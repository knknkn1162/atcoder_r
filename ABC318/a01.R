# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

N <- inputs[1]; M <- inputs[2]; P <- inputs[3]

1:N |>
  as_tibble() |>
  filter((value - M) %% P == 0) |>
  nrow() |>
  cat()