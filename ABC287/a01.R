options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
S <- readLines(conn, n=N)

S |>
  as_tibble() |>
  filter(value == "For") |>
  nrow() |>
  (\(x) ifelse(x > (N%/%2), "Yes", "No"))() |>
  cat()