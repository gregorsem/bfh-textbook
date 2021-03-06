require(shape)
#pdf(file = "property_fig2bSTEP1.pdf", width = 9, height = 7)
#pdf(file = "property_fig2bSTEP2.pdf", width = 9, height = 7)
#pdf(file = "property_fig2bSTEP3.pdf", width = 9, height = 7)
pdf(file = "property/property_fig2b.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.8
annotatesize <- 1.8
labelsize <- 1.5
graphlinewidth <- 2
segmentlinewidth <- 1.5
namesize <- 1.8

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")


uA <- function(x, y, alpha = 0.5, lambda = 0) {
  (x^(alpha)*y^(1 - alpha))^(1-lambda)*((10 - x)^(alpha)*(15 - y)^(1 - alpha))^lambda
}

indiffcurveA1 <- function(x, U = 3, A = 1, a = 0.5) {
  ((((U-2)/A)*(1/x)^a)^(1/(1-a)))
}

indiffcurveA2 <- function(x, U = 3, A = 1, a = 0.5) {
  (((U/A)*(1/x)^a)^(1/(1-a)))
}

indiffcurveA3 <- function(x, U = 3, A = 1, a = 0.5) {
  ((((U+2)/A)*(1/x)^a)^(1/(1-a)))
}

#Aisha happens to have found 8 apples and 2 oranges, 
#and Betty happens to have found 2 apples and 13 oranges. 
#Aisha's utility (8^0.5)*(2^0.5) = 4
#Betty's utility (2^0.5)*(13^0.5) = 5.09

par(mar =  c(4, 4.5, 4, 4.5))
xlims <- c(0, 10)
ylims <- c(0, 15)
xlims2 <- c(10, 0)
ylims2 <- c(15, 0)

plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = "",
     ylab = "",
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = axislabelsize, 
     bty = "n",
     xaxs="i", 
     yaxs="i")


npts <- 500 
npts2 <- 501
#Specify the sequences of points for graphing. 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)
#xx2 <- seq(xlims[1], xlims[2], length.out = npts)
#xx3 <- seq(xlims[1], xlims[2], length.out = npts2)
#xx4 <- seq(xlims[1], 10, length.out = npts2)

#Draw the lines for the graphs
lines(xx1, indiffcurveA1(xx1), col = COLA[3], lwd = graphlinewidth)
lines(xx1, indiffcurveA2(xx1), col = COLA[3], lwd = graphlinewidth)
lines(xx1, indiffcurveA3(xx1), col = COLA[3], lwd = graphlinewidth)
#lines(xx2, solowCondition(xx2, delta = 5), col = COL[3], lwd = 4)
#lines(xx2, solowInfeas(xx2, delta = 5), col = COL[1], lwd = 4, lty = 2)

#Customize ticks and labels for the plot
ticksy <- seq(from = 0, to = 15, by = 1)
ylabels <- seq(from = 0, to = 15, by = 1)
ticksx <- seq(from = 0, to = 10, by = 1)
xlabels <- seq(from = 0, to = 10, by = 1)
axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis = labelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)

#mtext(expression(paste("A's coffee (kilograms), ", x^A)), side=1, line = 2.5, cex = axislabelsize)
text(0.5*xlims[2], -1.5, expression(paste("A's coffee (kilograms), ", x^A)), xpd = TRUE, cex = axislabelsize) 
text(-0.95, 0.5*ylims[2], expression(paste("A's data (gigabytes), ", y^A)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#Add arrows for A: 
Arrows(-0.95, 11.5, -0.95, 14, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5, xpd = TRUE)
Arrows(7.5, -1.6, 9, -1.6, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5, xpd = TRUE)

#Annotation of the three graphs and the NE
text(0.4, 9, expression(u[1]^A), cex = annotatesize)
text(1.3, 9, expression(u[2]^A), cex = annotatesize)
text(3.1, 9, expression(u[3]^A), cex = annotatesize)
#text(16, 0.52, expression(paste("Nash Equilibrium")))

#Line to label B's endowment
#segments(0, 13, 2, 13, lty = 2, col = "darkgray", lwd = 2)
#segments(2, 0, 2, 13, lty = 2, col = "darkgray", lwd = 2)


text(-0.3, -1.4, expression("Ayanda"), xpd = TRUE, cex = namesize, col = COLA[4])
text(10.5, 16.4, expression("Biko"), xpd = TRUE, cex = namesize, col = COLB[4])


#Set up second axes and labels
par(new = TRUE)
#par(mar =  c(6, 4, 4, 4))

xlims2 <- c(10, 0)
ylims2 <- c(15, 0)

plot(0, 0, xlim = xlims2, ylim = ylims2, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")),
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = 1.3, 
     bty = "n",
     xaxs="i", 
     yaxs="i")

axis(side = 3, at = ticksx, pos = 0, labels = xlabels, cex.axis = labelsize)
axis(side = 4, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)
#axis(side=3, at = xlims2, pos = 0)
text(5, -1.6, expression(paste("B's coffee (kilograms), ", x^B)), xpd = TRUE, cex = axislabelsize)
text(-0.95, 7, expression(paste("B's data (gigabytes), ", y^B)), xpd = TRUE, cex = axislabelsize, srt = 270) 

#Add arrows:
Arrows(-0.95, 11.5, -0.95, 14, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5, xpd = TRUE)
Arrows(7.5, -1.6, 9, -1.6, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5, xpd = TRUE)


indiffcurveB1 <- function(x, U = 3.741657, A = 1, a = 0.5) {
  ((((U-2)/A)*(1/x)^a)^(1/(1-a)))
}

indiffcurveB2 <- function(x, U = 3.741657, A = 1, a = 0.5) {
  (((U/A)*(1/x)^a)^(1/(1-a)))
}

indiffcurveB3 <- function(x, U = 3.741657, A = 1, a = 0.5) {
  ((((U+2)/A)*(1/x)^a)^(1/(1-a)))
}

lines(xx1, indiffcurveB1(xx1), col = COLB[2], lwd = graphlinewidth)
lines(xx1, indiffcurveB2(xx1), col = COLB[2], lwd = graphlinewidth)
lines(xx1, indiffcurveB3(xx1), col = COLB[2], lwd = graphlinewidth)

#Label B's indifference curves
text(0.55, 10, expression(u[1]^B), cex = annotatesize)
text(1.7, 10, expression(u[2]^B), cex = annotatesize)
text(3.7, 10, expression(u[3]^B), cex = annotatesize)

#Add a point for the initial endowment
points(1, 14, pch = 16, col = "black", cex = 1.5)

#Annotating B's endowment
text(0.8, 13.5, expression(z), cex = annotatesize)


dev.off()

