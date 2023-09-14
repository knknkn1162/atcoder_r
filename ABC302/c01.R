# tidyverse
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

N <- inputs[1]; M <- inputs[2]
strs <- readLines(conn, n = N)

compare1 <- function(sa, sb) {
  map2(sa |> str_split(""), sb |> str_split(""),
    \(x,y) sum(x != y)
  ) |> unlist()
}
#if(N > 7) {cat("skip if N > 7")}
#stopifnot(N <= 7)
gtools::permutations(N, N, strs) |>
  as_tibble() |>
  rowwise() |>
  group_map(\(stb, key)
    stb |>
      as_vector() |>
      as_tibble() |>
      mutate(v2 = lag(value)) |>
      drop_na() |>
      (\(x) all(compare1(x$value, x$v2) == 1)  )() 
  ) |>
  unlist() |>
  any() |>
  (\(x) if_else(x, "Yes", "No"))() |>
  cat()