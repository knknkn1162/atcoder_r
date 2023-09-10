options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
input <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
A <- input[1]; B <- input[2]
1:9 |>
  matrix(nrow=3, byrow=TRUE) |>
  as_tibble() |>
  filter((V1 == A & V2 == B) | (V2 == A & V3 == B)) |>
  nrow() |>
  (\(x) if_else(x > 0, "Yes", "No"))() |>
  cat()