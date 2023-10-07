# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()

P <- readLines(conn, n=N)

P |>
  unique() |>
  str_split("") |>
  matrix() |>
  as_tibble() |>
  unnest_wider(V1, names_sep="") |>
  filter(V11 %in% c( "H", "D" , "C", "S")) |>
  filter(V12 %in% c("A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q","K")) |>
  nrow() |>
  (\(x) x == N)() |>
  if_else("Yes", "No") |>
  cat()