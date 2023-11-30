dat = read.csv("Example data.csv", header = TRUE)
head(dat)

hist(dat[,"eGFR"])

boxplot(dat[,"eGFR"])

pie(table(dat[,"Education"]))

barplot(table(dat[,"Education"]))
