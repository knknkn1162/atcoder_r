options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

inputs <- readLines(conn, n=1) |> str_split_1(" ") |> parse_number()
N <- inputs[1]; Q <- inputs[2]

Ts <- readLines(conn, n=Q) |> str_split(" ")
htable <- hash()
ans <- c()
# too slow.. for 10^5
for(q in 1:Q) {
  t <- Ts[[q]]
  a <- t[2]
  b <- t[3]
  key1 <- str_glue("{a}-{b}")
  key2 <- str_glue("{b}-{a}")
  switch(t[1],
    "1" = {
      htable[[key1]] = TRUE
    },
    "2" = {
      htable[[key1]] = FALSE
    },
    "3" = {
      if((!has.key(key1, htable)) | (!has.key(key2, htable)) ) {
        res <- "No"
      } else {
        res <- if_else(htable[[key1]] & htable[[key2]], "Yes", "No")
      }
      ans <- append(ans, res)
    }
  )
}

ans |>
  cat(sep="\n")