options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
S <- readLines(conn, n=1)
tb <- S |>
  str_split_1("") |>
  as_tibble() |>
  mutate(idx = row_number())

flag1 <- tb |>
  filter(value == "B") |>
  pull(idx) |>
  sum() |>
  (\(x) x %% 2 == 1)()
  
flag2 <- tb |>
  filter(value %in% c("K", "R")) |>
  pull(value) |>
  str_flatten("") |>
  (\(x) x == "RKR")()

(flag1 & flag2) |>
  if_else("Yes", "No") |>
  cat()