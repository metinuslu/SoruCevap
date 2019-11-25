# Clean the System & Console Variable --------------------
rm(list = ls())
cat("\014")
options(warn = -1)

# filename <- "Tahminler_Aylik_GBMv5_313_131_38_2019-10-22.rdata"
# path <- "E:\R_Paket\R_Final_YD\forecast"

path <- "C://R_Paket//R_Final_YD//forecast"
setwd(path)

# days <- seq(as.Date("2019-01-01"), as.Date("2019-12-31"), "days")
# days <- seq(as.Date("2019/01/01"), by = "days", length.out = 366)
# for (i in seq_along(days)) {
#   print(days[i])
#   paste0(days[i])
# }


# http://theautomatic.net/2018/07/11/manipulate-files-r/
sapply(paste0("Tahminler_Aylik_GBMv5_313_131_38_", seq(as.Date("2019/01/01"), by = "days", length.out = 365), ".rdata"), file.create)

file_list <- list.files(path, pattern = tolower(".RDATA"), recursive = TRUE)

for (filename in file_list) {
  print(filename)
}


start_date <- Sys.Date()
end_date <- (Sys.Date() - 30)