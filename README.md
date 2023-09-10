# ABC in R

```ps
Get-ChildItem ./test/A/in/* | Select -first 25 | %{Get-Content $_.FullName | Rscript --default-packages=tidyverse ./a01.R} > ans.txt
# vs
Get-ChildItem ./test/A/out/* | Select -first 25 | %{Get-Content $_.FullName}
```