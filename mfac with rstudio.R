#import the excel file at exact sheet and selection of columns and rows
library(readxl)
MFAC <- read_excel("MFAC.xlsx", sheet = "All", range = "H64:L88")

#view the dataset in R
View(MFAC)

#install package phonR
install.packages("phonR")

#access library phonR
library(phonR)

#create plot
with(MFAC, plotVowels(F1, F2, Vowel, group = Gender, pch.tokens = Vowel, cex.tokens = 1.2, alpha.tokens = 0.3, plot.means = TRUE, pch.means = Vowel, cex.means = 2, var.col.by = Gender, var.sty.by = Gender, hull.line = TRUE, hull.fill = TRUE, fill.opacity = 0.1, xlim = c(3500, 500), ylim = c(1200, 200), main = "Spoken (Hz)", legend.kwd = "bottomleft", pretty = TRUE))

#assigning variables in order to calculate areas
poly.area <- with(MFAC, vowelMeansPolygonArea(F1, F2, Vowel, poly.order = c("seed", "sad", "sod", "sued"), group = Gender))
hull.area <- with(MFAC, convexHullArea(F1, F2, group = Gender))

#returns the areas in a simple table
rbind(poly.area, hull.area)
