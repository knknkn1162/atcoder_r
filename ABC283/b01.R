options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
Q <- readLines(conn, n=1) |> parse_number()

qs <- readLines(conn, n=Q) |> str_split(" ") |> map(\(x) parse_number(x))

res <- c()

for(idx in 1:Q) {
  vec <- qs[[idx]]
  switch(vec[1],
    "1" = {
      A[vec[2]] <- vec[3]
    },
    "2" = {
      res[idx] <- A[vec[2]]
    }
  )
}
res |>
  discard(is.na) |>
  cat(sep="\n")