# Clean the System & Console Variable --------------------
rm(list = ls())
cat("\014")
options(warn = -1)

path <- "C://R_Paket//R_Final_YD//forecast"
setwd(path)

day_diff <- 30

file_list <- list.files(path, pattern = ".rdata", recursive = TRUE)
file_num <- length(file_list)

#filename <- toString(strsplit((file_list[file_num]) , ".rdata"))
last_filename <- toString(strsplit((toString(file_list[file_num])) , ".rdata"))
last_filename <- strsplit(last_filename, "_")
last_date <- as.Date(last_filename[[1]][7]) - day_diff

first_filename <- toString(strsplit((toString(file_list[1])) , ".rdata"))
first_filename <- strsplit(first_filename, "_")
first_date <- as.Date(first_filename[[1]][7])

if (first_date < last_date) {
  #sapply(paste0("Tahminler_Aylik_GBMv5_313_131_38_", seq(from=end_date, to=start_date, by="days"), ".rdata"), unlink)
  
  days <- seq(from = first_date, to = last_date, "days")
  
  count <- 0
  for (i in seq_along(days)) {
    for (filename in file_list) {
      if (grepl(days[i], filename)) {
        file.remove(filename)
        cat(paste("Delete Filename:", filename, "-", days[i]), sep = "\n")
        count <- count +1
      }
    }
  }
  
  cat(paste(),
      paste("Deleted Dates", first_date, "to", last_date),
      paste("All File Count:", file_num), 
      paste("Deleted File Count:", count), 
      paste("File Count:", file_num - count), 
      sep="\n")
  
} else {
  cat("NO File ...")
}
