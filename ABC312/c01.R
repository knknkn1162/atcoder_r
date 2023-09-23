options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; M <- inputs[2]

A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
B <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number() |> sort(decreasing = TRUE)

atb <- A |>
  as_tibble() |>
  summarize(n = n(), .by=value) |>
  arrange(value) |>
  mutate(label = cumsum(n))

btb <- B |>
  as_tibble() |>
  summarize(n = n(), .by=value) |>
  arrange(-value) |>
  mutate(label = cumsum(n)) |>
  arrange(value)

c(A-1,A,B,B+1) |>
  as_tibble() |>
  arrange(value) |>
  distinct() |>
  mutate(vA = cut(value, breaks =c(0, atb$value, Inf), include.lowest = TRUE, right=FALSE, labels=c(0,atb$label)) ) |>
  mutate(vB = cut(value, breaks=c(0, btb$value, Inf), labels=c(btb$label, 0) )) |>
  mutate(vA = as.numeric(levels(vA))[vA], vB = as.numeric(levels(vB))[vB]) |>
  filter(vA >= vB) |>
  head(1) |>
  pull(value) |>
  cat()