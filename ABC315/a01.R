options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

S <- readLines(conn, n=1)

S |>
  str_remove_all("[aeiou]") |>
  cat()