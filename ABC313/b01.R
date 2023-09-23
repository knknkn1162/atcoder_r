options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; M <- inputs[2]
if(M == 0) {
  cat(-1); quit()
}
tb <- read.table(conn, nrows=M) |>
  as_tibble()

mtb <- tb |> pivot_longer(everything()) |> mutate(flag = name == "V1")

1:N |>
  map(\(x) mtb |> filter(value==x) |> pull(flag) |> all()) |>
  unlist() |>
  (\(x) (1:N)[x])() |>
  (\(x) if_else(length(x) == 1, x[1], -1))() |>
  cat()