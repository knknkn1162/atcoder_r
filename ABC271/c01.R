# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

res <- gtools::binsearch(\(n)
  if_else(length(A) - length(intersect(A, 1:n)) >= length(setdiff(1:n, A))*2,
    1,
    -1
  )
  , range=1:(N+1)
)

ans <- if(res$flag == "Upper Boundary") {
  0
} else {
  res$where[1]
}
ans |>
  cat()
