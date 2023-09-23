options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()

str_pi <- "3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679"

str_pi |>
  str_sub(1, N+2) |>
  cat()