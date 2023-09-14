# tidyverse
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
strs <- readLines(conn, n=2)
counta <- strs |> str_count("@")

avec <- "atcoder" |> str_split_1("")

tb <- strs |>
  str_remove_all("@") |>
  str_split("") |>
  map(\(vec) vec |> 
    as_tibble() |>
    group_by(value) |>
    summarize(n = n())
  ) |>
  (\(x) full_join(x[[1]], x[[2]], by = join_by(value)))() |>
  replace_na(list(n.x = 0, n.y = 0)) |>
  rowwise() |>
  mutate(diff = n.x - n.y) |>
  ungroup()

flag <- tb |>
  filter(diff != 0) |>
  pull(value) %in% avec |>
  all()

tb |>
  summarize(x = sum(max(diff,0)), y = sum(max(-diff,0))) |>
  (\(tb) tb[["x"]] <= counta[[2]] & tb[["y"]] <= counta[[1]])() |>
  (\(b) if_else(b & flag, "Yes", "No"))() |>
  cat()