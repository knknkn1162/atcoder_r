# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()

read.table(conn, nrows = N) |>
  as_tibble() |>
  rowwise() |>
  group_map(\(stb, key) expand_grid(x=stb$V1:(stb$V2-1), y=stb$V3:(stb$V4-1))) |>
  list_rbind() |>
  distinct() |>
  nrow() |>
  cat()