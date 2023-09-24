options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; M <- inputs[2]

if(M == 0) {
  cat(N)
  ooo()
} else {
  tb <- read.table(conn, nrows=M) |>
    as_tibble() |>
    (\(xtb) add_row(xtb, V1=xtb$V2, V2=xtb$V1))() |>
    nest(.by=V1)
}

res <- 0
init_c <- 1
htable <- rep(FALSE,N)
for(i in 1:N) {
  vec <- i
  if(htable[i]) next
  res <- res+1
  while(1) {
    nvec <- tb |>
      filter(V1 %in% vec) |>
      pull(data) |>
      list_rbind()
    if(length(nvec) == 0) break
    nvec <- nvec |>
      filter(htable[V2] == FALSE) |>
      pull()
    if(length(nvec)==0) break
    htable[nvec] <- TRUE
    vec <- nvec
  }
}

cat(res)