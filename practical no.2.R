Student.Mental.health <- read.csv(
  "C:/Users/Admin/Desktop/ANKITA TIWARI/DATA ANALYSIS/Student Mental health.csv",
  stringsAsFactors = TRUE
)
names(Student.Mental.health)
lm(`Choose.your.gender` ~ `Age`)
attach(Student.Mental.health)


##text file
read.delim(
  "C:/Users/Admin/Desktop/ANKITA TIWARI/DATA ANALYSIS/Text_data.txt",
  stringsAsFactors = TRUE
)
View(Text_data)
names(Text_data)
lm(Gender ~ Age)
attach(Text_data)

