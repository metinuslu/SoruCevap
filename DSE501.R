# Clean the System & Console Variable --------------------
rm(list = ls())

x <- -1:7

for (i in 1:length(x)) {
  if (x[i]<=0) {
    print(paste(x[i], ":", 1))
  } else {
    result <- 0
    for (j in 1:x[i]) {
      t <- 2*j+1
      result <- result + t
    }
    print(paste(x[i], ":", result))
  }
}