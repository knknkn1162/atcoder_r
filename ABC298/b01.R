rotate <- function(x) t(apply(x, 2, rev))
# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()
arr <- readLines(conn, n=N) |> str_split(" ") |> map(\(x) parse_number(x)) |> data.frame()
brr <- readLines(conn, n=N) |> str_split(" ") |> map(\(x) parse_number(x)) |> data.frame() 

1:4 |>
  accumulate(\(acc,nxt) acc |> rotate(), .init=arr) |>
  map(\(a) a |> unlist() |> (\(b) any(b == 1 & brr == 0) == FALSE)()) |>
  unlist() |>
  any() |>
  (\(x) if_else(x, "Yes", "No"))() |>
  cat()