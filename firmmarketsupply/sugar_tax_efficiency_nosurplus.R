require(shape)
library(tidyverse)
pdf(file = "firmmarketsupply/sugar_tax_efficiency_nosurplus.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.8
labelsize <- 1.5
namesize <- 1.8
annotatesize <- 1.5
graphlinewidth <- 2
segmentlinewidth <- 1.5

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#c6dbef", "#4eb3d3", "#2b8cbe", "#0868ac","#084081")
COLC <- c("#fcfbfd", "#efedf5", "#dadaeb", "#bcbddc", "#9e9ac8", "#807dba", "#6a51a3", "#54278f", "#3f007d")
Grays <- gray.colors(25, start = 1, end = 0)
CBCols <- c("#009E73","#0072B2","#E69F00")

par(mar =  c(4, 4, 1, 1))

mrsA <- function(x, rmax = 20, xmax = 10) {
  rmax - (rmax/xmax)*x
}

uA <- function(x, y, rmax = 20, xmax = 10) {
  y + rmax*x - (1/2)(rmax/xmax)*x^2
}

Qs <- function(x, slope = 0.7, tax = 0){
  slope*x + 5 + tax
}

Qs_tax<- function(x, slope = 0.7, tax = 3.5){
  slope*x + 5 + tax
}

xlims <- c(0, 10.25)
ylims <- c(0, 20.5)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 
a <- c(46.08, 55, 64)
b <- c(46.08, 55, 64)

#Equilibrium intersections
eq1 <- uniroot(function(x)  mrsA(x) - Qs(x)  , c(.01,10), tol=1e-8)   
eq2 <- uniroot(function(x)  mrsA(x) - Qs_tax(x)  , c(.01,10), tol=1e-8) 
xpre <- as.numeric(eq1[1])
xpost <- as.numeric(eq2[1])

plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")), 
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = axislabelsize, 
     bty = "n",
     xaxs = "i", 
     yaxs = "i")


ticksy <- c(0, NA,  Qs(xpre), NA, 20, ylims[2])
ylabels <- c(NA, NA, expression(paste(p[a])), NA, expression(paste(bar(p) )), NA)
ticksx <- c(0, NA, xpre, 10, xlims[2])
xlabels <- c(NA, NA, expression(paste(X[a])), expression(paste(frac(bar(p), beta ) )), NA)


npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)

# Tax Rev 
#xpoly1 <- c(0, xpost, xpost, 0)
#ypoly1 <- c(Qs(xpost), Qs(xpost), Qs_tax(xpost), Qs_tax(xpost))
#polygon(x = xpoly1, y = ypoly1, col = COL[3], density=NULL, border = NA)

# DWL of PS
#xpoly <- c(0, 0, xpre)
#ypoly <- c(Qs(xpost), Qs(xpre), Qs(xpre))
#polygon(x = xpoly, y = ypoly, col = COL[2], density=NULL, border = NA)


# DWL of CS
#xpoly2 <- c(xpost, xpre, xpost) 
#ypoly2 <- c(Qs(xpre), Qs(xpre), Qs_tax(xpost)) 
#polygon(x = xpoly2, y = ypoly2, col = COL[4], density=NULL, border = NA)

# CS 
# xpoly3 <- c(0, 0, xpre)
# ypoly3 <- c(Qs(xpre), mrsA(0), Qs(xpre))
# polygon(x = xpoly3, y = ypoly3, col = COLA[1], density=NULL, border = NA)

# PS
# xpoly4 <- c(0, 0, xpre, 0)
# ypoly4 <- c(Qs(xpre), Qs(0), Qs(xpre), Qs(xpre))
# polygon(x = xpoly4, y = ypoly4, col = COLB[1], density=NULL, border = NA)

# text(2, 7.5, expression(paste("Economic profit")), xpd = TRUE, cex = labelsize)
# text(2, 11.5, expression(paste("Consumer surplus")), xpd = TRUE, cex = labelsize) 
# 

#Lines for mrs graph
lines(xx1, mrsA(xx1), col = CBCols[1], lwd = graphlinewidth)

lines(xx1, Qs(xx1), col = CBCols[2], lwd = graphlinewidth)
#lines(xx1, Qs_tax(xx1), col = COLB[5], lwd = graphlinewidth)

# Prices
##Price with tax
#segments(0, Qs_tax(xpost), xpost, Qs_tax(xpost), lty = 2, col = "gray" , lwd = segmentlinewidth) 
##Price pre-tax
segments(0, Qs(xpre), xpre, Qs(xpre), lty = 2, col = Grays[20] , lwd = segmentlinewidth)

# Vert Seg from Q 
#segments(xpost, 0, xpost, Qs_tax(xpost), lty = 2, col = "gray" , lwd = segmentlinewidth)

segments(xpre, 0, xpre, Qs(xpre), lty = 2, col = Grays[20]  , lwd = segmentlinewidth)

# Horizontal to PS
#segments(0, Qs(xpost), xpost, Qs(xpost), lty = 2, col = "gray" , lwd = segmentlinewidth)

#Label axes
#mtext(expression(paste("Quantity of sugary drinks (liters), ", X)), side=1, line = 2.5, cex = axislabelsize)
text(0.5*xlims[2], -2, expression(paste("Quantity of sugary drinks (liters), ", X)), xpd = TRUE, cex = axislabelsize) 
text(-0.8, 0.5*ylims[2], expression(paste("Price per liter ($), ", p)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#Label a
#points(xpost, Qs_tax(xpost), pch = 16, col = "black", cex = 1.5)
#text(xpost, Qs_tax(xpost) + 0.75, expression(b), cex = annotatesize)

#Label b
points(xpre, Qs(xpre), pch = 16, col = "black", cex = 1.5)
text(xpre + 0.1, Qs(xpre) + 0.75, expression(a), cex = annotatesize)

#Label c
#points(xpost, Qs(xpost), pch = 16, col = "black", cex = 1.5)
#text(xpost + 0.2, Qs(xpost) - 0.3, expression(d), cex = annotatesize)

#Label d
#points(xpost, Qs(xpre) , pch = 16, col = "black", cex = 1.5)
#text(xpost + 0.2, Qs(xpre) + 0.3, expression(c), cex = annotatesize)

#segments(4.11765, 6.17647, 5.88, 8.88, lty = 1, col = COL[2] , lwd = graphlinewidth)
#text(8.5, 14, expression(paste("Supply with tax, ", tau)), cex = labelsize)
#text(8.5, 14, expression(paste(p(x) == (c + tau) + x)), cex = labelsize)
#text(8.5, 7.8, expression(paste("Pre-tax supply, ", p(x) == c + x)), cex = labelsize)
text(9.1, 12.5, expression(paste("Sellers' supply")), cex = labelsize)

#Label mrs function
text(9.1, 4.5, expression(paste("Buyers' demand")), cex = labelsize)
#Arrows(6, 8.7, 6, 10.9, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.2, code = 3)
#text(6.6, 9.95, expression(paste("Tax" == tau)), cex = labelsize)

# Label CS
#text(1.2, 14, expression(paste("Consumer Surplus")))
axis(1, at = ticksx, pos = 0, labels = FALSE)
text(x = ticksx, par("usr")[3] - 0.4, labels = xlabels, srt = 0, pos = 1, xpd = TRUE, cex = labelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)


dev.off()

