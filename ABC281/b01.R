options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
S <- readLines(conn, n=1)

S |>
  str_detect("^[A-Z][1-9]\\d{5}[A-Z]$") |>
  if_else("Yes", "No") |>
  cat()