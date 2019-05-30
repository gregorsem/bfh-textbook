#Graph Designer: Simon Halliday & Scott Cohn
#Authors: Bowles, Foley and Halliday
#Title: Coordination, Conflict and Competition: A Text in Microeconomics

library(shape)
library(pBrackets)
pdf(file = "risk/indiff_red_risk.pdf", width = 10, height = 8)


#Set parameters for graphics
axislabelsize <- 1.5
labelsize <- 1.1
graphlinewidth <- 2
segmentlinewidth <- 1.5

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#c6dbef", "#4eb3d3", "#2b8cbe", "#0868ac","#084081")
COLC <- c("#fcfbfd", "#efedf5", "#dadaeb", "#bcbddc", "#9e9ac8", "#807dba", "#6a51a3", "#54278f", "#3f007d")

#Edited the margins to cater for the larger LHS labels
par(mar =  c(4, 4, 1, 1))

#Indifference curves of a risk-averse homo economicus (2nd graph out of the two for 4.7)

indiffA <- function(x, ua = 2, slope = 1/12) {
  ua + slope*(x)^2
}

seg <- function(x, m, b){
  m*x + b
}
  
#Add limits on axes and levels of utility for each indifference curve
ylims <- c(0, 40)
xlims <- c(0, 25)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 

plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")), 
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = axislabelsize, 
     bty = "n", 
     xaxs="i", 
     yaxs="i"
)

#x and y limits with plain axes without ticks/numbers to match previous graph

#ticksx <- seq(from = 0, to = xlims[2]+1, by = 4)
#xlabels <- seq(from = 0, to = xlims[2], by = 1)
ticksx <- c(xlims[1], 3.5, 16.6, xlims[2])
xlabels <- c(NA, expression(paste(Delta^T)), expression(paste(Delta^P)), NA)
#ticksy <- seq(from = 0, to = ylims[2]+1, by = 4)
#ylabels <- seq(from = 0, to = ylims[2], by = 1)
ticksy <- c(ylims[1], indiffA(3.5, ua = 16.2), indiffA(16.6, ua = 2), ylims[2])
ylabels <- c(NA, expression(paste(y^T)), expression(paste(y^P)), NA)

axis(1,at = ticksx,  pos = 0, labels = xlabels)
axis(2,at = ticksy,  pos = 0, labels = ylabels, las = 1)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)
xx2 <- seq(0, xlims[2], length.out = npts)
xx3 <- seq(xlims[1], 0, length.out = npts)
xx4 <- seq(-11, 0, length.out = npts)
xx5 <- seq(3, 18, length.out = npts)


lines(xx1, indiffA(xx1, ua = 2), col = COLB[4], lwd = graphlinewidth)
lines(xx1, indiffA(xx1, ua = 16.2), col = COLB[4], lwd = graphlinewidth)
lines(xx1, indiffA(xx1, ua = 28.4), col = COLB[4], lwd = graphlinewidth)

#Axis labels and draw linear utility function
mtext(expression(paste("Risk, ", Delta)), side = 1, line = 2.5, cex = axislabelsize)
text(-1.6, 0.5*ylims[2], expression(paste("Average income, ", "y")), xpd = TRUE, cex = axislabelsize, srt = 90) 

#label the three indifference curves

text(20.5, indiffA(20)+3.355, expression(paste(v[1])), xpd = TRUE, cex = labelsize)
text(16, indiffA(18)+9.8, expression(paste(v[2])),  xpd = TRUE, cex = labelsize)
text(10.5, indiffA(16)+15.5, expression(paste(v[3])),  xpd = TRUE, cex = labelsize)

#Label average wealth curve and indifference curves generally

text(19, 22.5, expression(paste("Reduced")), xpd = TRUE, cex = labelsize)
text(19, 21, expression(paste("Expected")), xpd = TRUE, cex = labelsize)
text(19, 19.5, expression(paste("Income")), xpd = TRUE, cex = labelsize)

# Bracket
brackets(x1 = 17, y1 = indiffA(16.6, ua = 2), 
         x2 = 17, y2 = indiffA(3.5, ua = 16.2),  ticks = 0.5, curvature = 0.5, type = 1, 
         col = "black", lwd = 2, lty = 1, h = 0.5, xpd = TRUE)

# Segments
segments(3.5, 0, 3.5, indiffA(3.5, ua = 16.2), lty = 2, col = "gray", lwd = segmentlinewidth)
segments(0, indiffA(3.5, ua = 16.2), 16.6, indiffA(3.5, ua = 16.2), lty = 2, col = "gray", lwd = segmentlinewidth)
segments(0, indiffA(16.6, ua = 2), 16.6, indiffA(16.6, ua = 2), lty = 2, col = "gray", lwd = segmentlinewidth)
segments(16.6, 0, 16.6, indiffA(16.6, ua = 16.2), lty = 2, col = "gray", lwd = segmentlinewidth)

#The tangent line to the higher indifference curve
#m <- (indiffA(16, ua = 2) - indiffA(5, ua = 16.2))/(16 - 4.75)
#This works for a lower b. 
#lines(xx1, seg(x = xx1, m = 0.43, b = 15.5), col = COLA[2], lty = 2, lwd = segmentlinewidth)
#Trying to find a higher b. 
lines(xx1, seg(x = xx1, m = 0.6, b = 15), col = COLA[4], lty = 1, lwd = graphlinewidth)

# Points
points(3.5, indiffA(3.5, ua = 16.2), pch = 16, col = "black", cex = 1.5,xpd = TRUE)
text(3.5 + 0.5, indiffA(3.5, ua = 16.2) - 0.5, expression(paste("b")), xpd = TRUE, cex = labelsize)

points(16.6, indiffA(16.6, ua = 2), pch = 16, col = "black", cex = 1.5,xpd = TRUE)
text(16.6 - 0.3, indiffA(16.6, ua = 2) + 0.5, expression(paste("a")), xpd = TRUE, cex = labelsize)

points(16.6, indiffA(16.6, ua = 16.2), pch = 16, col = "black", cex = 1.5,xpd = TRUE)
text(16.6 + 0.5, indiffA(16.6, ua = 16.2) - 0.5, expression(paste("a'")), xpd = TRUE, cex = labelsize)


text(22, 31, expression(paste("Tax and")), xpd = TRUE, cex = labelsize)
text(22, 29.5, expression(paste("transfer line")), xpd = TRUE, cex = labelsize)

# Arrows
Arrows(16.2, -1.8, 4, -1.8, col = "black", code = 2, xpd = TRUE, length = 0.1, lwd = 2, arr.type = "triangle")
Arrows(-0.7, indiffA(16.6, ua = 2) - 1, -0.7, indiffA(3.5, ua = 16.2) + 1.5, col = "black", code = 2, xpd = TRUE, length = 0.1, lwd = 2, arr.type = "triangle")


dev.off()