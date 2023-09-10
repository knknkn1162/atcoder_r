options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
S <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
S |>
  as_tibble() |>
  mutate(diff = value - lag(value, default=0)) |>
  filter((value %% 25) == 0,value >= 100,value <= 675, diff >= 0) |>
  (\(x) if_else(nrow(x) == 8, "Yes", "No"))() |>
  cat()