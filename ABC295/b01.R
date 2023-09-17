# slider
options(scipen=100)
#conn <- file("stdin", open="r")
conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
R <- inputs[1]; C <- inputs[2]
A <- readLines(conn, n=R)

# map(position and value)
tb <- A |>
  str_split("") |>
  matrix() |>
  as_tibble() |>
  unnest_wider(V1, names_sep="") |>
  mutate(idx = row_number()) |>
  pivot_longer(-idx) |>
  mutate(name = name |> str_remove("V1") |> as.numeric())

on.exit({
  A |> cat(sep="\n")
}, add = TRUE)

tb |>
  filter(str_detect(value, "\\d")) |>
  mutate(value = value |> as.numeric()) |>
  rowwise() |>
  group_map(\(stb,key) expand_grid(idx=(stb$idx-stb$value):(stb$idx+stb$value), name=(stb$name-stb$value):(stb$name+stb$value)) |> mutate(diff = abs(stb$idx-idx)+abs(stb$name-name)) |> filter(diff <= stb$value)  ) |>
  list_rbind() |>
  distinct(idx,name) |>
  mutate(value = ".") |>
  right_join(tb, join_by(idx==idx,name==name)) |>
  mutate(value = coalesce(value.x,value.y)) |>
  pivot_wider(id_cols = idx) |>
  rowwise() |>
  mutate(map = str_flatten((c_across(-idx)))) |>
  pull(map) |>
  cat(sep="\n")