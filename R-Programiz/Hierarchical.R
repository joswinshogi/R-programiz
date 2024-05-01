library(cluster)
data("mtcars")
hclust = hclust(dist(mtcars),method = 'complete')
plot(hclust,main = 'Hierarchical Clustering of Cars')