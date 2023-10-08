# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs<- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; M <- inputs[2]

tb <- read.table(conn,nrows=M) |>
  as_tibble()

tb |>
  (\(stb) add_row(tb, V2=stb$V1,V1=stb$V2))() |>
  summarize(n = n(), str = str_flatten(sort(V2), collapse=" "), .by = V1) |>
  arrange(V1) |>
  complete(V1=1:N) |>
  replace_na(list(n=0)) |>
  mutate(res = str_c(n, str, sep=" ")) |>
  replace_na(list(res="0")) |>
  pull(res) |>
  cat(sep="\n")