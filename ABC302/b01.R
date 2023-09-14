# tidyverse
options(scipen=100)
#conn <- file("stdin", open="r")
conn <- stdin()
inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()

H <- inputs[1]; W <- inputs[2]
inputs <- readLines(conn, n=H)
dist = list(
  tibble(dx = 0, dy = 0:4),
  tibble(dx = 0, dy = 0:-4),
  tibble(dx = 0:4, dy = 0),
  tibble(dx = 0:-4, dy = 0),
  tibble(dx = 0:4, dy = 0:4),
  tibble(dx = 0:4, dy = 0:-4),
  tibble(dx = 0:-4, dy = 0:4),
  tibble(dx = 0:-4, dy = 0:-4)
)
tb <- inputs |>
  str_split_fixed("",n = W) |>
  as_tibble() |>
  mutate(row = row_number()) |>
  pivot_longer(-row, names_to="col") |>
  mutate(col = parse_number(col))
res <- list()
# too slow
for(h in 1:H) {
  for(w in 1:W) {
    res <- append(res,
      dist |>
        map(\(dtb) 
          dtb |>
            mutate(row = h + dy, col = w + dx) |>
            left_join(tb) |>
            drop_na()
        )
    )
  }
}
res |>
  detect(\(dtb) dtb |> summarize(str = str_flatten(value)) |> pull() |> str_detect("snuke")) |>
  select(row, col) |>
  write_delim(stdout(), col_names=FALSE)