# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; M <- inputs[2]

lst <- readLines(conn, n=M) |> str_split(" ") |> map(\(vec) parse_number(vec[-1]))

expand_grid(x=1:N, y=1:N) |>
  filter(x < y) |>
  rowwise() |>
  mutate(flag = any(
    lst |> map(\(vec) setequal(intersect(c(x,y), vec),c(x,y))) |> unlist() 
    )
  ) |>
  pull(flag) |>
  all() |>
  if_else("Yes", "No") |>
  cat()