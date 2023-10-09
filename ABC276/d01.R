# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

gcd <- function(x,y) {
  r <- x%%y;
  return(ifelse(r != 0, Recall(y, r), y))
}

N <- readLines(conn, n=1) |> parse_number()
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

gcd_num <- A |> sort() |> reduce(\(acc,nxt) gcd(acc,nxt))
A |> as_tibble() |>
  # generalize
  mutate(b = value / gcd_num) |>
  rowwise() |>
  mutate(fact = list(gmp::factorize(b) |> as.numeric())) |>
  pull(fact) |>
  unlist() |>
  (\(vec) if_else(all(vec %in% c(2,3)), length(vec), -1))() |>
  cat()