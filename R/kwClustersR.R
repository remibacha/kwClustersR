#' @title Create Clusters from a Keyword List
#'
#' @description kwClustersR regoupes your keywords into keywords clusters. It uses the Jaro–Winkler distance algorithm to create clusters. You can specify the cluster ratio to manage the size of your keywords groups. Try several ratio to adjust your keyword clusterization.
#'
#' @author Rémi Bacha
#'
#' @param df
#' @param ratio

#' @return NULL
#'
#' @examples kwClustersR(df,0.9)
#'
#' @export kwClustersR

kwClustersR <- function(df,ratio) {
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
