
# Clean the System & Console Variable --------------------
rm(list = ls())
cat("\014")
options(warn = -1)

# Just to make it reproducible
set.seed(1234)

FinalGrades <- rnorm(n=40, mean=75, sd=5)

# FinalGrades[1] = 50
head(FinalGrades)
tail(FinalGrades)
summary(FinalGrades)
# max(FinalGrades)
# min(FinalGrades)


# str(FinalGrades)
# class(FinalGrades)

# ls("package:stas")
# help(rnorm)
# example("rnorm")


# for(i in 1:40)
#   {
#   print(1:i)
#   }

student_list <- data.frame()

for(i in 1:40)
  {
  print(paste0("Student_", i))
  student_list <- rbind(student_list, data.frame(StudentName=paste0("Student_", i), stringsAsFactors = FALSE))
}


student_list <- cbind(student_list, data.frame(FinalGrades))
str(student_list)

# names(student_list) <- c("StudentName","FinalGrades")

unsuccessful_student <- subset(student_list, FinalGrades < 60, select=c(StudentName, FinalGrades))

normal_student <- subset(student_list, FinalGrades >= 60 & FinalGrades <=85, select=c(StudentName, FinalGrades))

successful_student <- subset(student_list, FinalGrades > 85, select=c(StudentName, FinalGrades))

if (length(unsuccessful_student$StudentName)>0){
  for(j in 1:length(unsuccessful_student$StudentName)){
    # print(unsuccessful_student$StudentName[j])
    unsuccessful_student$StudentName[j] = paste0("Unsuccessful.",unsuccessful_student$StudentName[j])
  }
}

if (length(normal_student$StudentName)>0){
  for(j in 1:length(normal_student$StudentName)){
    # print(normal_student$StudentName[j])
    normal_student$StudentName[j] = paste0("Normal.",normal_student$StudentName[j])
  }
}

if (length(successful_student$StudentName)>0){
  for(j in 1:length(successful_student$StudentName)){
    # print(successful_student$StudentName[j])
    successful_student$StudentName[j] = paste0("Successful.",successful_student$StudentName[j])
  }
}


FinalGrades_Last <- data.frame()
FinalGrades_Last <- rbind(unsuccessful_student, normal_student, successful_student)


age <- sample(18:24, size=40, replace = TRUE, prob = NULL)

DFRM <- cbind(FinalGrades_Last$StudentName, data.frame(age), FinalGrades_Last$FinalGrades)

names(DFRM) <- c("StudentName","Age", "FinalGrades")