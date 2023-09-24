options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

S <- readLines(conn, n=1)

arr <- S |> str_split_1("00")

len1 <- length(arr)-1
len2 <- arr |> str_flatten("") |> str_length()

(len1+len2) |>
  cat()