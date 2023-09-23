options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()

lst <- list()
for(i in 1:N) {
  readLines(conn, n=1)
  lst[[i]] <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
}
X <- readLines(conn, n=1) |> parse_number()

res <- tibble(v = lst) |>
  mutate(idx = row_number()) |>
  rowwise() |>
  mutate(len = length(v)) |>
  filter(X %in% v) |>
  ungroup() |>
  filter(len == min(len)) |>
  pull(idx)

cat(length(res), sep="\n")
if(length(res) == 0) {
  cat("\n")
} else {
  cat(res)
}