### kwClustersR.R
### version 1.0 @RemiBacha
### https://remibacha.com


#1. Install and load needed R packages
list.of.packages <- c("readxl", "stringdist")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library(readxl)
library(stringdist)


#2. Open your keyword_list.xlsx dataset in R Studio
pathxlsx <- '/Users/remi/Downloads/keyword_list.xlsx'

df <-  read_excel(pathxlsx, 
                  sheet = 1, 
                  col_names = TRUE,   
                  na = "",                     
                  skip=0)


#3. Create the function to clusterize keywords
kwClusters <- function(df,ratio) {
      #Define the number of cluster you want to create
      kclusters = round(ratio * length(unique(df$Keyword)))
  
      #Compute distance metrics between strings
      uniqueThema <- unique(as.character(df$Keyword))
      distancemodels <- stringdistmatrix(uniqueThema,uniqueThema,method = "jw")
  
      #Display your clusters dendrogram
      rownames(distancemodels) <- uniqueThema
      hc <- hclust(as.dist(distancemodels))
      par(mar = rep(2, 4)) #Cette ligne permet d'éviter l'erreur "figure margins too large"
      plot(hc)
  
      #Create your cluster file and display a graph with the number of keywords in each cluster
      dfClust <- data.frame(uniqueThema, cutree(hc, k=kclusters))
      names(dfClust) <- c('Thema','cluster')
      plot(table(dfClust$cluster))
  
      View(dfClust)
}


#4. Start kwClusters
kwClusters(df,0.9)
