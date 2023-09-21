# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; M <- inputs[2]

if(M == 0) {
  cat("No")
  quit()
}
tb <- read.table(conn, nrows=M) |>
  as_tibble()

gtb <- tb |>
  (\(x) add_row(x, V2=x$V1, V1=x$V2))() |>
  nest(.by=V1)

vx <- gtb |> rowwise() |> filter(data |> nrow() == 1) |> head(1) |> pull(V1)
if(is.null(vx) | length(vx) == 0) {
  cat("No")
  quit()
} 
prev <- 0
line <- rep(0,N)
line[1] <- vx
for(i in 2:N) {
  res <- gtb |> filter(V1 == vx) |> pull(data) |> unlist()
  vx <- setdiff(res, line[i-2])
  if(length(vx) != 1) {
    break
  }
  line[i] <- vx
}

setequal(line |> sort(), 1:N) |>
  (\(x) if_else(x, "Yes", "No"))() |>
  cat()