options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

S <- readLines(conn, n=1)

sarr <- S |>
  str_split_1("")
level <- 0
htable <- hash::hash(letters,-1)
ans <- TRUE
for(s in sarr) {
  switch(s,
    "(" = {
      level <- level+1
    },
    ")" = {
      for(k in hash::keys(htable)) {
        if(htable[[k]] == level) {
          htable[[k]] <- -1
        }
      }
      level <- level-1
    },
    # a-z
    {
      if(htable[[s]] != -1) {
        ans <- FALSE
        break
      }
      htable[[s]] <- level
    }
  )
}

ans |>
  (\(x) if_else(x, "Yes", "No"))() |>
  cat()