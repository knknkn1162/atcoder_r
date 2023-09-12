
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
A <- readLines(conn, n=1) |> str_split_1(" ") 

tb <- c(0,3,1,4,1,5,9) |>
  as_tibble() |>
  mutate(cum = cumsum(value)) |>
  mutate(pos = LETTERS[1:7])

A |> as_tibble() |>
  rename(pos = value) |>
  inner_join(tb) |>
  summarize(ans = max(cum) - min(cum)) |>
  pull() |>
  cat()