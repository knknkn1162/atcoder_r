options(scipen=100)
#conn <- file("stdin", open="r")
conn <- stdin()

N <- readLines(conn, n=1) |> parse_number()

htable <- readLines(conn, n=N) |>
  str_split(" ") |>
  matrix() |>
  as_tibble() |>
  unnest_wider(everything(), names_sep="") |>
  (\(x) hash::hash(x$V11,x$V12))()
keys <- hash::keys(htable)
hflag <- hash::hash(keys, FALSE)
res <- TRUE
for(key in keys) {
  k <- key
  if(hflag[[k]]) next
  while(1) {
    if(hash::has.key(k, htable)) {
      k <- htable[[k]]
      if(hash::has.key(k, hflag)) {
        if(hflag[[k]]) {
          res <- FALSE
          break
        }
        hflag[[k]] <- TRUE
      }
    } else {
      break
    }
  }
}

if_else(res, "Yes", "No") |>
  cat()