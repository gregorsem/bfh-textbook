require(shape)
pdf(file = "specprodexch/production_tech_marginfig.pdf", width = 9, height = 7)

#Set parameters for graphics
pointsize <- 1.8
axislabelsize <- 2.2
labelsize <- 2.1
namesize <- 2.1
annotatesize <- 1.9
graphlinewidth <- 2
segmentlinewidth <- 1.5


COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#c6dbef", "#4eb3d3", "#2b8cbe", "#0868ac","#084081")

par(mar =  c(5, 5, 1, 1))

mrsA <- function(x, rmax = 10, xmax = 20) {
  rmax - (rmax/xmax)*x
}

uA <- function(x, y, rmax, rmax = 10, xmas = 20) {
  y + rmax*x - (1/2)(rmax/xmax)*x^2
}

xlims <- c(0, 12)
ylims <- c(0, 12)

npts <- 501 


plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")), 
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = axislabelsize, 
     bty = "n",
     xaxs="i", 
     yaxs="i")

# ticksy <- seq(from = 0, to = ylims[2], by = 2)
# ylabels <- seq(from = 0, to = ylims[2], by = 2)
# ticksx <- seq(from = 0, to = xlims[2], by = 2)
# xlabels <- seq(from = 0, to = xlims[2], by = 2)
ticksy <- c(0, 6, ylims[2])
ylabels <- c(NA, expression(paste(k[1])), NA)
ticksx <- c(0, 4, xlims[2])
xlabels <- c(NA, expression(paste(l[1])), NA)

axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis = labelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)


mtext(expression(paste("Hours of labor, ", l)), side=1, line = 3, cex = axislabelsize)
text(-1.1, 0.5*ylims[2], expression(paste("Quantity of capital goods, ", k)), xpd = TRUE, cex = axislabelsize, srt = 90) 


#For production technique 
segments(0, 6, 4, 6, lty = 2, col = "grey22", lwd = segmentlinewidth)
segments(4, 0, 4, 6, lty = 2, col = "grey22", lwd = segmentlinewidth)

points(4, 6, pch = 16, col = "black", cex = 1.5)
text(5.75, 7.75, expression(paste("A production")), cex = labelsize)
text(5.75, 6.75, expression(paste("technique, ", (list(x, l, k)))), cex = labelsize)
text(3.75, 5.7, expression(paste(i)), cex = labelsize)


dev.off()
