options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
S <- readLines(conn, n=1)

S |>
  str_replace_all("na", "nya") |>
  cat()