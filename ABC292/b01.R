# tidyverse, sets
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; Q <- inputs[2]

cnts <- rep(0,N)
for(q in 1:Q) {
  inputs <- readLines(conn, n=1) |>
    str_split_1(" ") |>
    parse_number()
  p = inputs[2]
  switch(inputs[1],
    "1" = {
      cnts[p] = cnts[p] + 1
    },
    "2" = {
      cnts[p] = cnts[p] + 2
    },
    "3" = {
      if_else(cnts[p] >= 2, "Yes", "No") |>
        cat()
    }
  )
}