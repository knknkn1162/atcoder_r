# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()
inputs <- readLines(conn, n=2) |> parse_number()
N <- inputs[1]; Q <- inputs[2]
tb <- tibble(number = 0, box = 0)
for (q in 1:Q) {
  item <- readLines(conn, n = 1) |> str_split_1(" ") |> parse_number()
  key = item[2]
  # TODO: too slow
  switch(item[1],
    "1" = {
      tb <- tb |> add_row(number = item[2], box = item[3])
    },
    "2" = {
      tb |> filter(box == key) |> arrange(number) |> pull(number) |> cat()
    },
    "3" = {
      tb |> filter(number == key) |> arrange(box) |> pull(box) |> unique() |> cat()
    }
  )
}