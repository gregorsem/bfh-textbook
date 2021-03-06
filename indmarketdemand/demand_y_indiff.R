require(shape)
pdf(file = "indmarketdemand/demand_y_indiff.pdf", width = 9, height = 7)


#Set parameters for graphics
pointsize <- 1.8
axislabelsize <- 1.8
labelsize <- 1.5
namesize <- 1.8
annotatesize <- 1.5
graphlinewidth <- 2
segmentlinewidth <- 1.5

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")
Grays <- gray.colors(25, start =1, end = 0)

#Edited the margins to cater for the larger LHS labels
par(mar =  c(4, 7, 1, 1))

mrsA <- function(x, rmax = 10, xmax = 20) {
  rmax - (rmax/xmax)*x
}


uA <- function(x, y, rmax = 2, xmax = 12) {
  y + rmax*x - (1/2)*(rmax/xmax)*x^2
}

indiffA1 <- function(x, uA = 10, rmax = 2.5, xmax = 10) {
  uA - rmax*x + (1/2)*(rmax/xmax)*(x^2)
}


bcA <- function(x, w = 20, p = 2) {
  w - p*x
}

tan_line <- function(x, m, b){
  x*m + b
}


xlims <- c(0, 12)
ylims <- c(0, 18)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 
a <- c(13, 15, 17)

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
ticksy <- c(0, 13, 15, 17, ylims[2])
ylabels <- c(NA, expression(paste(y[1] == 13)), expression(paste(y[2] == 15)), expression(paste(y[3] == 17)), NA)
#ylabels <- c(NA, expression(paste(13)), expression(paste(15)), expression(paste(17)), NA)
ticksx <- c(0, 3, 8, xlims[2])
xlabels <- c(NA, expression(x[0]), expression(x[1]), NA)

axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis = labelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)
xx2 <- seq(2, 4, length.out = npts)
xx3 <- seq(7, 9, length.out = npts)

#lines(xx1, bcA(xx1, w = 12, p = 1), col = COLB[3], lwd = graphlinewidth)
#lines(xx1, indiffA1(xx1, uA = 20, rmax = 2.5, xmax = 10), col = COLB[4], lwd = graphlinewidth)


mtext(expression(paste("Kilograms of fish, ", x)), side = 1, line = 2.5, cex = axislabelsize)
text(-1.9, 10, expression(paste("Money left over, ", y)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#Label the iso-welfare functions for the HG, Aisha
text(11.8, 1.6, expression(u[1]), cex = annotatesize)
text(11.8, 3.6, expression(u[2]), cex = annotatesize)
text(11.8, 5.6, expression(u[3]), cex = annotatesize)


contour(x, y, 
        outer(x, y, uA),
        #labels = c("v1", "v2", "v3"),
        drawlabels = FALSE,
        col = COLA[3],
        lwd = graphlinewidth,
        levels = a, 
        xaxs = "i", 
        yaxs = "i", 
        add = TRUE)


segments(3, 0, 3, 14.75, col = Grays[20], lty = 2, lwd = segmentlinewidth)
segments(8, 0, 8, 9.333, col = Grays[20], lty = 2, lwd = segmentlinewidth)

lines(xx2, tan_line(xx2, -1.5, 12.25), col = Grays[22], lty = 2, lwd = graphlinewidth + 0.1)
lines(xx2, tan_line(xx2, -1.5, 14.25), col = Grays[22], lty = 2, lwd = graphlinewidth + 0.1)
lines(xx2, tan_line(xx2, -1.5, 16.25), col = Grays[22], lty = 2, lwd = graphlinewidth + 0.1)

lines(xx3, tan_line(xx3, -4/6, 7.6663), col = Grays[22], lty = 2, lwd = graphlinewidth  + 0.1)
lines(xx3, tan_line(xx3, -4/6, 9.6663), col = Grays[22], lty = 2, lwd = graphlinewidth  + 0.1)
lines(xx3, tan_line(xx3, -4/6, 11.6663), col = Grays[22], lty = 2, lwd = graphlinewidth  + 0.1)


points(3, 7.75, pch = 16, col = "black", cex = 1.2)
points(3, 11.75, pch = 16, col = "black", cex = 1.2)
points(3, 9.75, pch = 16, col = "black", cex = 1.2)

points(8, 6.333, pch = 16, col = "black", cex = 1.2)
points(8, 4.333, pch = 16, col = "black", cex = 1.2)
points(8, 2.333, pch = 16, col = "black", cex = 1.2)


dev.off()
