options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |>parse_number()
N <- inputs[1]; M <- inputs[2]
lst <- 1:M |>
  map(\(x) {
    readLines(conn,n=1);
    readLines(conn,n=1) |>
      str_split_1(" ") |>
      parse_number()
  })

# list of sets
tb <- lst |>
  matrix() |>
  as_tibble() |>
  mutate(idx = row_number())

1:(2^M-1) |> map(\(m) m |>
  intToBits() |>
  as.numeric() |>
  as_tibble() |>
  mutate(idx = row_number()) |>
  inner_join(tb, join_by(idx == idx)) |>
  filter(value==1) |> 
  pull(V1) |>
  unlist() |>
  unique() |>
  setequal(1:N)
) |>
  unlist() |>
  sum() |>
  cat()