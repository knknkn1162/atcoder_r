options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()
S <- readLines(conn, n=1)
Q <- readLines(conn, n=1) |> parse_number()

txc <- readLines(conn, n=Q) |> str_split(" ")

htable <- S |>
  str_split_1("")

is_updated <- c()
is_updated_idx <- 1
chr_flag <- 0
# too slow...
for(q in 1:Q) {
  v <- txc[[q]]
  idx <- as.numeric(v[[2]])
  switch(v[1],
    "1" = {
      htable[idx] <- v[[3]]
      is_updated[is_updated_idx] <- idx
      is_updated_idx = is_updated_idx+1
    },
    "2" = {
      chr_flag <- -1
      is_updated <- c(); is_updated_idx=1
    },
    "3" = {
      chr_flag <- 1
      is_updated <- c(); is_updated_idx=1
    }
  )
}

htable |>
  as_tibble() |>
  mutate(updated = row_number() %in% is_updated) |>
  mutate(value2 = case_when(
    chr_flag == 0 ~ value,
    chr_flag == 1 ~ str_to_upper(value),
    chr_flag == -1 ~ str_to_lower(value)
  )) |>
  mutate(value = if_else(updated, value, value2)) |>
  pull(value) |>
  str_flatten("") |>
  cat()
  