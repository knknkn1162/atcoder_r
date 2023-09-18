options(scipen=100)
#conn <- file("stdin", open="r")
conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |>parse_number()
N <- inputs[1]; M <- inputs[2]
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

gtb <- 1:(N-1) |>
  as_tibble() |>
  mutate(v2 = value+1) |>
  mutate(flag = (value %in% A)) |>
  mutate(idx = consecutive_id(flag)) |>
  group_by(idx) |>
  filter(flag) |>
  group_trim() |>
  summarize(lst = list(c(value,v2) |> unique() |> rev()) ) |>
  rowwise() |>
  mutate(min = min(lst))

ltb <-1:N |>
  as_tibble() |>
  mutate(flag = value %in% setdiff(1:N, (gtb |> pull(lst) |> unlist()))) |>
  mutate(idx = consecutive_id(flag)) |>
  group_by(idx) |>
  filter(flag) |>
  group_trim() |>
  summarize(lst = list(value)) |>
  rowwise() |>
  mutate(min = min(lst))

bind_rows(gtb,ltb) |>
  arrange(min) |>
  pull(lst) |>
  unlist() |>
  cat()