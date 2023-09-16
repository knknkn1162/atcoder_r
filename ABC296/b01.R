options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
boards <- readLines(conn, n=8)

boards |>
  str_split("") |>
  unlist() |>
  matrix(ncol=8,byrow=TRUE) |>
  data.frame() |>
  set_names(letters[1:8]) |>
  as_tibble() |>
  mutate(idx = 9-row_number()) |>
  pivot_longer(-idx, names_to="label", values_to="chr") |>
  filter(chr == "*") |>
  (\(x) str_glue("{x1}{x2}", x1= x$label, x2=x$idx))() |>
  cat()