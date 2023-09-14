# ABC in R

```ps
# ans.txt
Get-ChildItem ./test/A/in/* | %{Get-Content $_.FullName | Rscript --default-packages=tidyverse ./a01.R} > ans.txt
# bns.txt
Get-ChildItem ./test/A/out/* | %{Get-Content $_.FullName} > bns.txt
# compare
diff ans.txt bns.txt
# cns.txt to compare
paste ans.txt bns.txt > cns.txt
```

## TODO

+ ABC309 B
