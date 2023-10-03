str <- "
tourist 3858
ksun48 3679
Benq 3658
Um_nik 3648
apiad 3638
Stonefeang 3630
ecnerwala 3613
mnbvmar 3555
newbiedmy 3516
semiexp 3481
"

# tidyverse, utils
options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

S <- readLines(conn, n=1)

read_delim(I(str), delim=" ", col_names=FALSE) |>
  filter(X1 == S) |>
  pull(X2) |>
  cat()