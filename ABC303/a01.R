options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
A <- readLines(conn, n=1) |> parse_number()
strs <- readLines(conn, n=2)

strs |>
  str_replace_all("0", "o") |>
  str_replace_all("l", "1") |>
  as_tibble() |>
  mutate(eq = value == lag(value)) |>
  pull(eq) |>
  all(na.rm = TRUE) |>
  (\(x) if_else(x, "Yes", "No"))() |>
  cat()