options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

Ts <- readLines(conn, n=1) |> parse_number()
res <- c()
for(i in 1:Ts) {
  N <- readLines(conn, n=1)
  A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
  
  res[i] <- A |>
    as_tibble() |>
    filter(value %% 2 == 1) |>
    nrow()
}

cat(res, sep="\n")