## Created by: Thanos Strantzalis
## Date: November 2013
## Dependencies: Rasta library
## Description: This script opens the anom.2000.03.tiff file, creates 30 random points
## inside the extend of the raster and evaluates the standard deviation
## of these 30 pixel values   

rm(list = ls())
library(rasta)

filepath <- system.file("extdata", "anom.2000.03.tiff", package ="rasta")
ras <- raster(filepath)

randomPoints <- runifpoint(30, win = as.vector(t(bbox(ras))))
pnts <- as.data.frame(randomPoints)

std<-extract(ras,pnts)
std<-sd(std)

# Plot
plot(ras)
plot(randomPoints, add = TRUE, col = "red", pch = 18, cex = 0.8)
mtext(side = 3, line = 1, paste("The standard deviation of the 30 sample points
is:",std), cex = 1)





