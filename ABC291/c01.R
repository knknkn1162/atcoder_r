# tidyverse, sets
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
X <- readLines(conn, n=1)

mtb <- tibble(value = c("R","L","U","D"), diff.x=c(1,-1,0,0), diff.y = c(0,0,1,-1))

X |>
  str_split_1("") |>
  as_tibble() |>
  inner_join(mtb) |>
  mutate(pos.x = cumsum(diff.x), pos.y = cumsum(diff.y)) |>
  add_row(pos.x = 0, pos.y = 0) |>
  select(pos.x,pos.y) |>
  n_distinct() |>
  (\(x) if_else(N+1 != x, "Yes", "No"))() |>
  cat()