#Graph Designer: Simon Halliday
#Authors: Bowles and Halliday
#Title: Coordination, Conflict and Competition: A Text in Microeconomics

library(shape)
#pdf(file = "feasible_live_learn_newSTEP1.pdf", width = 8, height = 8)
#pdf(file = "feasible_live_learn_newSTEP2.pdf", width = 8, height = 8)
#pdf(file = "feasible_live_learn_newSTEP3.pdf", width = 8, height = 8)
pdf(file = "constrained_optimization/feasible_live_learn_new.pdf", width = 8, height = 8)

#Set parameters for graphics
pointsize <- 1.8
axislabelsize <- 2
labelsize <- 1.5
namesize <- 1.8
annotatesize <- 1.5
graphlinewidth <- 2
segmentlinewidth <- 1.5

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#c6dbef", "#4eb3d3", "#2b8cbe", "#0868ac","#084081")
grays <- gray.colors(25, start = 1, end = 0)


#Edited the margins to cater for the larger LHS labels
par(mar =  c(4, 8, 1, 1))

ppf <- function(x, slope = 1/64, bary = 4) {
  bary - slope *x^2
}


uFn <- function(x, y, alpha = 0.3){
  (x^alpha)*(y^(1-alpha))
}

ylims <- c(0, 4.2)
xlims <- c(0, 16)

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


ticksx <- seq(from = 0, to = xlims[2], by = 2)
xlabels <- seq(from = 0, to = xlims[2], by = 2)
ticksy <- c(ylims[1], 1, ppf(12), 3, ppf(4), 4, ylims[2])
ylabels <- c(NA, 1, expression(paste(y[e] == 1.75)), expression(paste(y[i] == 3)), expression(paste(y[f] == 3.75)), 4, NA)



axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis = labelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)
xx2 <- seq(0, xlims[2], length.out = npts)
xx3 <- seq(xlims[1], 0, length.out = npts)
xx4 <- seq(-11, 0, length.out = npts)

#Draw the polygon for shading the feasible set
xpoly1 <- seq(from = xlims[1], to = 16, length.out = 500)
ypoly1 <- ppf2(xpoly1)
polygon(x = c(xpoly1, xpoly1[1]), y = c(ypoly1, rev(ypoly1)[1]), col=COLA[1], density=NULL, border = NA)
polygon(x = c(xlims[2], xlims[2], rev(xpoly1), 0),
        y = c(ylims[2], 0, rev(ypoly1), ylims[2]), 
        col=COLB[1], density=NULL, border = NA)


#Draw the graphs
lines(xx1, ppf2(xx1), col = COLA[5], lwd = graphlinewidth)
#lines(xx2, fishProd(xx2, k = 2), col = COLB[3], lwd = graphlinewidth)
#lines(xx3, feasibleLabor(xx3, time = 10), col = COL[3], lwd = graphlinewidth)
#lines(xx4, manufactureProd(xx4, k = 0.1, alpha = 2), col = COLB[4], lwd = graphlinewidth)

#Label the feasible frontier
text(10, 0.7, expression("Feasible"), cex = axislabelsize)
text(10, 0.5, expression("frontier"), cex = axislabelsize)
#text(10, 0.25, expression(paste((ff[1]) )), cex = axislabelsize)
Arrows(11.6, 0.5, 14.5, 0.5, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

text(6, 1.5, expression("Feasible"), cex = axislabelsize)
text(6, 1.3, expression("set"), cex = axislabelsize)

text(14, 3, expression("Infeasible"), cex = axislabelsize)

#Axis labels
text(0.5*xlims[2], -0.38, expression(paste("Living (hours), ", x == 16 - h)), xpd = TRUE, cex = axislabelsize) 
text(-3.6, 0.5*ylims[2], expression(paste("Learning, ", y)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#mtext(expression(paste("Living (hours), ", x == 16 - h)), side = 1, line = 2.5, cex = axislabelsize)
#text(-2.9, 0.5*ylims[2], expression(paste("Learning, ", y)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#Add mrs = mrt at i
# text(8, 2.8, expression(paste(mrs(x,y) == mrt(x,y))), cex = labelsize)
# Arrows(8, 2.75, 8, 2.45, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#Label the indifference curves
# text(17, 1, expression(u[1]^A), cex = labelsize)
# text(17, 1.55, expression(u[2]^A), cex = labelsize)
# text(17, 2.25, expression(u[3]^A), cex = labelsize)

#Annotate max u point on feasibility frontier
text(8.4, ppf(8) + 0.1, expression(paste(i)), cex = labelsize)
segments(8, 0, 8, ppf(x = 8), lty = 2, col = grays[20], lwd = segmentlinewidth)
segments(0, ppf(x = 8), 8, ppf(x = 8), lty = 2, col = grays[20], lwd = segmentlinewidth)
points(8, ppf(x = 8), pch = 16, col = "black", cex = 1.5)

text(4 + 0.4, ppf(4) + 0.1, expression(paste(g)), cex = labelsize)
segments(4, 0, 4, ppf(4), lty = 2, col = grays[20], lwd = segmentlinewidth)
segments(0, ppf(4), 4, ppf(4), lty = 2, col = grays[20], lwd = segmentlinewidth)
points(4, ppf(4), pch = 16, col = "black", cex = 1.5)


text(12 + 0.4, ppf(12) + 0.1, expression(paste(e)), cex = labelsize)
segments(12, 0, 12, ppf(x = 12), lty = 2, col = grays[20], lwd = segmentlinewidth)
segments(0, ppf(x = 12), 12, ppf(x = 12), lty = 2, col = grays[20], lwd = segmentlinewidth)
points(12, ppf(x = 12), pch = 16, col = "black", cex = 1.5)


dev.off()
