options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
S <- readLines(conn, n=1)

tb <- S |> str_split_1("") |> as_tibble()

res <- c()
# too slow
for(i in 1:(N-1)) {
  res[i] <- tb |>
    mutate(v2 = !(lag(value, n=i) == value)) |>
    drop_na() |>
    pull(v2) |>
    head_while(\(x) x) |>
    sum()
}
cat(res, sep="\n")