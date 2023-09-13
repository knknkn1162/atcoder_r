# tidyverse,utils,stats
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; D <- inputs[2]
tb <- read.table(conn) |> as_tibble()
# TODO: too slow
master <- tb |>
  mutate(idx = row_number()) |>
  (\(x) cross_join(x,x))() |>
  filter(idx.x != idx.y) |>
  rowwise() |>
  mutate(dist = stats::dist(rbind(c(V1.x, V2.x), c(V1.y, V2.y)))) |>
  filter(dist <= D) |>
  select(idx.x, idx.y) |>
  rename(src = idx.x, dst = idx.y)
res <- 1:N |>
  reduce(\(acc, nxt) master |>
    filter(src %in% acc) |>
    pull(dst) |>
    append(acc) |>
    sort() |>
    unique(), .init = c(1)
  )
(1:N %in% res) |>
  (\(x) if_else(x, "Yes", "No"))() |>
  cat(sep="\n")