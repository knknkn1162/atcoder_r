# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

H <- inputs[1]; W <- inputs[2]

S <- readLines(conn, n=H)
Ts <- readLines(conn, n=H)

# too slow
trans <- function(vec_str) {
  res <- vec_str |>
    str_split("") |>
    data.frame() |>
    as_tibble() |>
    rowwise() |>
    mutate(v = str_flatten(c_across(everything()))) |>
    arrange(v) |>
    pull(v)
  return(res)
}

St <- S |> trans()
Tt <- Ts |> trans()

all(St == Tt) |>
  if_else("Yes", "No") |>
  cat()
