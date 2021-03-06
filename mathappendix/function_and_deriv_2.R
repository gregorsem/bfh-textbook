#Graph Designer: Scott Cohn
#Authors: Bowles and Halliday
#Title: Coordination, Conflict and Competition: A Text in Microeconomics

library(shape)
pdf(file = "mathappendix/function_and_deriv_2.pdf", width = 8, height = 6)
par(mar=c(4,6,0.75,0.75))

#Set parameters for graphics
axislabelsize <- 1.5
labelsize <- 1.1
graphlinewidth <- 3
segmentlinewidth <- 2

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")

xlims <- c(0, 4)
ylims <- c(-10, 10)

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

ticksx <- c(xlims[1], xlims[2])
xlabels <- c(NA, NA)
ticksy <- c(ylims[1], 0, 8, ylims[2])
ylabels <- c(NA, 0, 8, NA)

axis(1, at = ticksx,  pos = 0, labels = xlabels, cex.axis = axislabelsize)
axis(2, at = ticksy,  pos = 0, labels = ylabels, las = 1, cex.axis = axislabelsize)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)
xx2 <-seq(xlims[1], xlims[2] - 4, length.out = npts)
xx3 <- seq(xlims[1], 0, length.out = npts)

#Axis labels
mtext(expression(paste("", x)), side = 1, line = 2.5, cex = axislabelsize)
text(-.45, 0, expression(paste("", y)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#equations:
eq <- function(x){
  -6*x + 8
}


# segments
segments(1.333, -10, 1.333, 10, lty = 2, col = "gray", lwd = segmentlinewidth)

# lines
lines(xx1, eq(xx1), col = COLB[4], lwd = graphlinewidth)

# points
points(1.333, 0, pch = 16, col = "black", cex = 1.5)

# label function
text(3, -5, expression(paste({"y'" == frac(dy, dx)} == -6*x + 8)),  xpd = TRUE, cex = labelsize)

dev.off()
