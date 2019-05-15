
# Clean the System & Console Variable --------------------
rm(list = ls())
cat("\014")
options(warn = -1)

oklid_distance <- function(x_koordinat, y_koordinat) {

  df <- data.frame(matrix(ncol = length(x_koordinat), nrow = length(y_koordinat)))
  
  column <- c("k1", "k2", "k3", "k4", "k5")
  row <- c("k1", "k2", "k3", "k4", "k5")
  
  colnames(df) <- column
  rownames(df) <- row
  
    for (i in 1:length(x_koordinat)){
      for (j in 1:length(y_koordinat)){
        if(i==j){
          d = 0
          df[i,j] = d
        } else {
          d = sqrt( (x_koordinat[j]-x_koordinat[i])^2 + (y_koordinat[j]-y_koordinat[i])^2 )
          df[i,j] = d
        }
      }
    }
  return(df)
}

x_koordinat <- c(40,25,15,15,10)
y_koordinat <- c(50,85, 75,80, 35)

df <- oklid_distance(x_koordinat, y_koordinat)

print(df)