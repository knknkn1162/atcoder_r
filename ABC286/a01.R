options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; P <- inputs[2]; Q <- inputs[3]; R <- inputs[4]; S <- inputs[5]
A <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

tibble(before=P:Q, after=R:S) |>
  # order
  (\(x) add_row(x, before=x$after, after=x$before))() |>
  full_join(tibble(before=1:N, value=A)) |>
  mutate(after = coalesce(after, before)) |>
  arrange(after) |>
  pull(value) |>
  cat()