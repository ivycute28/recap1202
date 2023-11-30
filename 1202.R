dat = read.csv("Example data.csv", header = TRUE)
head(dat)

hist(dat[,"eGFR"])

boxplot(dat[,"eGFR"])

pie(table(dat[,"Education"]))

barplot(table(dat[,"Education"]))

dat = read.csv("data10_1.csv", header = TRUE, fileEncoding = 'CP950')
head(dat)

library(RgoogleMaps)

lat = c(22.88751, 23.41373)
lon = c(120.023, 120.6562)
center = c(mean(lat), mean(lon))
zoom = min(MaxZoom(range(lat), range(lon)))


MyMap = GetMap(center = center, zoom = zoom, API_console_key = 'AIzaSyA4DVFtF70aXE7RgrXViy2z5Ku2pMkVxFI')

PlotOnStaticMap(MyMap)

MyMap2 = GetMap(center = center, zoom = zoom, maptype = "satellite", API_console_key = 'AIzaSyA4DVFtF70aXE7RgrXViy2z5Ku2pMkVxFI')

PlotOnStaticMap(MyMap2)
