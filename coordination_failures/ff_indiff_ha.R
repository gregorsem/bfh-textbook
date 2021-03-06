require(shape)
pdf(file = "coordination_failures/ff_indiff_ha.pdf", width = 9, height = 7)

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

par(mar =  c(4, 5, 1, 1))

indiffA <- function(ea, uA = 46.08) {
  uA + (1/2)*(ea)^2
}

output <- function(ea, eb = 12, alpha = 30, beta = 1/2){
  (alpha - beta*(ea+eb))*ea
}

uA <- function(ea, ya = output) {
  ya - 0.5*(ea)^2
}

mrsA <- function(ea){
  ea
}

slopeline <- function(ea, yint = 0.5, slope = 2){
  yint + slope*ea
}


xlims <- c(0, 24)
ylims <- c(0, 400)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 
a <- c(uA(ea = 12, output(ea = 12, eb = 12)), uA(ea = 15, output(ea = 15, eb = 0)), 300)

#B's value when at A's bliss point
#0.35*log(5.88) + 0.35*log(8.88) + 0.5*log(10 - 5.88) + 0.5*log(15 - 8.88) 

#B's bliss point x = 4.11765; y = 6.17647
#A's value when at A's bliss point
#0.5*log(4.11765) + 0.5*log(6.17647) + 0.35*log(10 - 4.11765) + 0.35*log(15 - 6.17647) 


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
ticksx <- seq(from = 0, to = xlims[2], by = 2)
xlabels <- seq(from = 0, to = xlims[2], by = 2)
ticksy <- c(0, 144, 225, 300, ylims[2])
ylabels <- c(NA, expression(paste(y[1]^A)), expression(paste(y[2]^A)), expression(paste(y[3]^A)), NA)
# ticksx <- c(0, 6.9, 12, 9.6, 16, 24, 26)
# xlabels <- c(NA, expression(paste(e^A,"*")), expression(paste(1/2*beta)), expression(paste(e^{AN})), expression(paste(alpha)), expression(paste(1/beta)), NA)

axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis= labelsize - 0.05)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis= labelsize - 0.05)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)

lines(xx1, output(xx1, eb = 0), col = COLA[4], lwd = graphlinewidth)
lines(xx1, output(xx1, eb = 12), col = COLA[4], lwd = graphlinewidth)
# lines(xx1, indiffA(xx1, uA = 10), col = COLA[4], lwd = graphlinewidth)
# lines(xx1, indiffA(xx1, uA = 28), col = COLA[4], lwd = graphlinewidth)
# lines(xx1, indiffA(xx1, uA = 46.08), col = COLA[4], lwd = graphlinewidth)
# lines(xx1, brfB(xx1, alpha = 16, beta = 1/24), col = COLB[4], lwd = graphlinewidth)
# lines(xx1, brfPEA(xx1, alpha = 16, beta = 1/24), col = COLA[4], lwd = graphlinewidth)
# lines(xx1, brfPEB(xx1, alpha = 16, beta = 1/24), col = COLB[4], lwd = graphlinewidth)

contour(x, y,
        outer(x, y, uA),
        drawlabels = FALSE,
        col = COLB[4],
        lwd = graphlinewidth,
        levels = a,
        xaxs="i",
        yaxs="i",
        add = TRUE)


# segments(2, 0, 2, ylims[2], lty = 2, col = "gray" , lwd = segmentlinewidth)
# segments(6, 0, 6, ylims[2], lty = 2, col = "gray" , lwd = segmentlinewidth)

#Axis labels
#mtext(expression(paste("A's hours, ", h^A)), side=1, line = 3.2, cex = axislabelsize)
text(0.5*xlims[2], -40, expression(paste("A's hours, ", h^A)), xpd = TRUE, cex = axislabelsize)
text(-2.1, 0.5*ylims[2], expression(paste("Output, ", y^A)), xpd = TRUE, cex = axislabelsize, srt = 90)

# text(-0.9, 0.5*ylims[2], expression(paste("Output, ", y^A)), xpd = TRUE, cex = axislabelsize, srt = 90)
# text(5, 12, expression(paste("slope", phantom()==h^A, phantom() == 2)), cex = annotatesize)
# Arrows(3.6, 12, 2.4, 12, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)
# text(9, 28, expression(paste("slope", phantom()==h^A, phantom() == 6)), cex = annotatesize)
# Arrows(7.6, 28, 6.4, 28, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#Label the iso-welfare functions for the HG, Aisha
text(2, 133, expression(u[1]^A), cex = annotatesize)
text(2, 213, expression(u[2]^A), cex = annotatesize)
text(2, 290, expression(u[3]^A), cex = annotatesize)

points(12, output(ea = 12), pch = 16, col = "black", cex = 1.5)
text(12 + 0.4, output(ea = 12) - 5, expression(paste("n")), cex = annotatesize)

points(15, output(ea = 15, eb = 0), pch = 16, col = "black", cex = 1.5)
text(15 + 0.4, output(ea = 15, eb = 0) - 5, expression(paste("a")), cex = annotatesize)


text(14.3, 288, expression(paste(y(h^A, h^B == 0))), cex = annotatesize)
text(19.8, 260, expression(paste(y(h^A, h^B >0))), cex = annotatesize)


dev.off()
