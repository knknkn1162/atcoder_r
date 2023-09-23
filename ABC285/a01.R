options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
a <- inputs[1]; b <- inputs[2]

b %in% c(2*a+(0:1)) |>
  (\(x) if_else(x, "Yes", "No"))() |>
  cat()