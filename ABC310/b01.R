options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
input1 <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- input1[1]; M <- input1[2]
D <- readLines(conn, n=N) |> str_split(" ")
P <- D |>
  map(\(x) parse_number(x)[1]) |>
  unlist()
Fs <- D |>
  map(\(x) parse_number(x)[-1:-2]) |>
  matrix() |>
  as_tibble() |>
  mutate(idx = row_number(), p = P)
# do process
tb <- Fs |>
  (\(x) cross_join(x,x, suffix = c(".o", ".x")))() |>
  rowwise() |>
  filter(
    #1
    p.o <= p.x &
    #2
    all(V1.x %in% V1.o) &
    #3
    ((setdiff(V1.o, V1.x) |> length()) != 0 | (p.o < p.x))
  ) |>
  (\(x) if_else(nrow(x) != 0, "Yes", "No"))() |>
  cat()
  