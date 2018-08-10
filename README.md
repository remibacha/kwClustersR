# kwClustersR
This R script helps you to create clusters from a keyword list to speed up your SEO keyword research.
The script is explained step by step on my blog post "[Clusteriser ses mots-clés avec R](https://remibacha.com/clusteriser-mots-cles/) (French)"

## Install
```
devtools::install_github("remibacha/kwClustersR")
```

## Getting started
Load the folowing packages
```
library(kwClustersR)
library(readxl)
library(stringdist)
```

Load Your keyword list into R. It should contain a column called "Keyword" with all your keywords in it. Check the [keyword_list.xlsx](https://github.com/remibacha/kwClustersR/blob/master/keyword_list.xlsx?raw=true) example.


```
pathxlsx <- '/Users/Downloads/keyword_list.xlsx'
df <-  read_excel(pathxlsx, sheet = 1, col_names = TRUE, na = "", skip=0)
```

Call the kwClustersR function by specified 2 arguments (your dataset, the clusters ratio)  and enjoy!
```
kwClustersR(df,0.9)
```

## Feedbacks
Questions and feedbacks welcome!

You want to contribute ? Open a pull request ;-) If you encounter a bug or want to suggest an enhancement, please open an issue.
