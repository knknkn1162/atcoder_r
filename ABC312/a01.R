options(scipen=100)
conn <- file("stdin", open="r")
#conn <- stdin()

S <- readLines(conn, n=1)

S %in% c("ACE","BDF","CEG","DFA","EGB","FAC","GBD") |>
  (\(x) if_else(x, "Yes", "No"))() |>
  cat()