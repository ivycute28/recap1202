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

dat[,1] = as.Date(dat[,1])
subdat = dat[dat[,1] <= as.Date("2015-09-30") & dat[,1] >= as.Date("2015-09-01") & dat[,6] == "台南市",]
nrow(subdat)

PlotOnStaticMap(MyMap, lat = subdat$最小統計區中心點Y, lon = subdat$最小統計區中心點X, pch = 19, col = "red", cex = 1)

dat[,1] = as.Date(dat[,1])
subdat = dat[dat[,1] <= as.Date("2015-09-30") & dat[,1] >= as.Date("2015-09-01") & dat[,6] == "台南市",]
nrow(subdat)

PlotOnStaticMap(MyMap, lat = subdat$最小統計區中心點Y, lon = subdat$最小統計區中心點X, pch = 19, col = "red", cex = 1)


x1 <- subdat$最小統計區中心點Y
x2 <- subdat$最小統計區中心點X
df <- data.frame(x1,x2)

## Use densCols() output to get density at each point
x <- densCols(x1,x2, colramp=colorRampPalette(c("black", "white")))
df$dens <- col2rgb(x)[1,] + 1L

## Map densities to colors
cols <-  colorRampPalette(c("#000099", "#00FEFF", "#45FE4F", 
                            "#FCFF00", "#FF9400", "#FF3100"))(256)
df$col <- cols[df$dens]

PlotOnStaticMap(MyMap, lat = df$x1, lon = df$x2, pch = 19, col = df$col, cex = 1.5)
