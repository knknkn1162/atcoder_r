# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()

tb <- read.table(conn, nrows=N) |>
  as_tibble()

gtb <- tb |>
  (\(x) add_row(x, tibble(V1=x$V2, V2=x$V1)))() |>
  nest(.by=V1) |>
  (\(x) hash::hash(x$V1, x$data))()

if(!hash::has.key("1", gtb)) {
  cat(1)
  zzzzzz()
}

htable <- tb |>
  unlist() |>
  sort() |>
  unique() |>
  (\(x) hash::hash(x, FALSE))()
# initialize
lst <- c(1)
while(1) {
  # modify
  for(val in lst) {
    htable[[as.character(val)]] = TRUE
  }
  # update
  lst <- lst |>
    as.character() |>
    map(\(val) gtb[[val]]) |>
    list_rbind() |>
    distinct() |>
    rowwise() |>
    filter(!htable[[as.character(V2)]]) |>
    pull()
  if(length(lst) == 0) {
    break
  }
}
ans <- 1
for(key in hash::keys(htable)) {
  if(htable[[key]]) {
    ans <- max(ans, as.numeric(key))
  }
}
cat(ans)
}