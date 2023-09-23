options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
R <- read.table(conn, nrows=N) |>
  as_tibble()

gtb <- R |>
  arrange(-V2) |>
  nest(.by=V1) |>
  rowwise()

# slow...
num1 <- gtb |>
  mutate(data = data |> slice_head(n=2) |> pull(V2) |> (\(x) x[1]+x[2]/2)()) |>
  pull(data) |>
  max(na.rm=TRUE)

num2 <- gtb |>
  mutate(data = data |> slice_head(n=1) |> pull(V2)) |>
  head(2) |>
  ungroup() |>
  summarize(sum = sum(data)) |> pull(sum)

max(num1, num2) |>
  cat()