# tidyverse, utils
options(scipen=100)
#conn <- file("stdin", open="r")
conn <- stdin()
N <- readLines(conn, n=1) |> parse_number()
str <- readLines(conn, n=1)

# str |>
#   str_extract_all("(o+-|-o+)") |>
#   unlist() |>
#   as_tibble() |>
#   mutate(len = str_length(value)-1) |>
#   summarize(max(len,-1)) |>
#   pull() |>
#   cat()