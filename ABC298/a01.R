# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()
S <- readLines(conn, n=1)

tb <- S |>
  str_split_1("") |>
  as_tibble() |>
  summarize(n = n(), .by = value) |>
  complete(value = c("o", "-", "x"), fill=list(n=0))

flag1 <- tb |> filter(value == "o") |> pull(n) >= 1
flag2 <- tb |> filter(value == "x") |> pull(n) == 0

(flag1 & flag2) |>
  (\(x) if_else(x, "Yes", "No"))() |>
  cat()