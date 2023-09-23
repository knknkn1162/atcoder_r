options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

M <- readLines(conn, n=1) |> parse_number()
D <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()


D |>
  as_tibble() |>
  add_row(value=0, .before=0) |>
  mutate(idx=row_number()-1, cum = cumsum(value), res = (sum(value)+1)/2-cum) |>
  filter(res>=0) |>
  arrange(res) |>
  head(1) |>
  (\(tb) if_else(tb$res==0, list(c(tb$idx,tb$value)),list(c(tb$idx+1,tb$res))))() |>
  unlist() |>
  cat()