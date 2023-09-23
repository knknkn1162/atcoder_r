options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; M <- inputs[2]

S <- readLines(conn, n=N)

df <- S |>
  str_split("") |>
  list_transpose() |>
  data.frame() |>
  set_names(1:M)

expand_grid(r_idx = 1:(N-9+1), c_idx = 1:(M-9+1)) |>
  rowwise() |>
  mutate(df = list(df[r_idx:(r_idx+8), c_idx:(c_idx+8)])) |>
  filter(
    all(df[1:3,1:3] == "#"),
    all(df[7:9,7:9] == "#"),
    all(c(df[4,1:4], df[1:4, 4], df[6, 6:9], df[6:9,6]) == ".")
  ) |>
  mutate(res = str_glue("{r_idx} {c_idx}")) |>
  pull(res) |>
  (\(x) if (length(x) == 0) {cat("")} else {cat(x, sep="\n")})()