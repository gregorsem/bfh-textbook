require(shape)
pdf(file = "specprodexch/production_irs_stacked.pdf", width = 9, height = 12)

#Set parameters for graphics
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
par(mar =  c(4, 7, 0.2, 1), mfrow = c(2, 1))


prodFn <- function(l, alpha = 2, k = 0.02) {
  k*l^alpha
}

MprodFn <- function(l, alpha = 2, k = 0.02) {
  k*alpha*l^(alpha - 1)
}

AprodFn <- function(l, alpha = 2, k = 0.02) {
  k*l^(alpha - 1)
}

Mpline <- function(l, constant = 0.3181472, slope = 0.125){
  constant + slope*l
}

xlims <- c(0, 10)
ylims <- c(0, 1.4)

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

# ticksy <- seq(from = 0, to = ylims[2], by = 0.25)
# ylabels <- seq(from = 0, to = ylims[2], by = 0.25)
# ticksx <- seq(from = 0, to = xlims[2], by = 1)
# xlabels <- seq(from = 0, to = xlims[2], by = 1)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)

xx3 <- seq(1, 3.5, length.out = npts)
xx4 <- seq(4.75, 7.25, length.out = npts)

lines(xx1, prodFn(xx1, alpha = 2, k = 0.02), col = COLB[4], lwd = graphlinewidth)
#lines(xx1, MprodFn(xx1, alpha = 2, k = 0.02), col = COLA[1], lwd = graphlinewidth)
#lines(xx1, AprodFn(xx1, alpha = 2, k = 0.02), col = COLA[2], lwd = graphlinewidth)
lines(xx3, Mpline(xx3, constant = prodFn(l = 2, k = 0.02, alpha = 2) - 2*MprodFn(l = 2, k = 0.02, alpha = 2), slope = MprodFn(l = 2, k = 0.02, alpha = 2)), col = Grays[21], lty = 2, lwd = graphlinewidth)
lines(xx4, Mpline(xx4, constant = prodFn(l = 6, k = 0.02, alpha = 2) - 6*MprodFn(l = 6, k = 0.02, alpha = 2), slope = MprodFn(l = 6, k = 0.02)), col = Grays[21], lty = 2, lwd = graphlinewidth)

#Axis Labels
#mtext(expression(paste("Hours of labor, ", l)), side = 1, line = 2.5, cex = axislabelsize)
text(-1.5, 0.75, expression(paste("Total product, ", x)), xpd = TRUE, cex = axislabelsize, srt = 90) 

segments(0, prodFn(l = 6, k = 0.02, alpha = 2), 6, prodFn(l = 6, k = 0.02, alpha = 2), lty = 2, col = grays[20] , lwd = segmentlinewidth)
segments(6, -1, 6, prodFn(l = 6, k = 0.02, alpha = 2), lty = 2, col = grays[20] , lwd = segmentlinewidth, xpd = TRUE)
segments(0, 0, 6, prodFn(l = 6, k = 0.02, alpha = 2), lty = 2, col = COLB[4] , lwd = segmentlinewidth)
points(6, prodFn(l = 6, k = 0.02), pch = 16, col = "black", cex = 1.5)

segments(0, prodFn(l = 2, k = 0.02, alpha = 2), 2, prodFn(l = 2, k = 0.02, alpha = 2), lty = 2, col = grays[20] , lwd = segmentlinewidth)
segments(2, -1, 2, prodFn(l = 2, k = 0.02, alpha = 2), lty = 2, col = grays[20] , lwd = segmentlinewidth, xpd = TRUE)
segments(0, 0, 2, prodFn(l = 2, k = 0.02, alpha = 2), lty = 2, col = COLB[4] , lwd = segmentlinewidth)
points(2, prodFn(l = 2, k = 0.02, alpha = 2), pch = 16, col = "black", cex = 1.5)

segments(0, prodFn(l = 4, k = 0.02, alpha = 2), 4, prodFn(l = 4, k = 0.02, alpha = 2), lty = 2, col = grays[20] , lwd = segmentlinewidth)
segments(4, -1, 4, prodFn(l = 4, k = 0.02, alpha = 2), lty = 2, col = grays[20] , lwd = segmentlinewidth, xpd = TRUE)
segments(0, 0, 4, prodFn(l = 4, k = 0.02, alpha = 2), lty = 2, col = COLB[4] , lwd = segmentlinewidth)
points(4, prodFn(l = 4, k = 0.02, alpha = 2), pch = 16, col = "black", cex = 1.5)

ticksy <- c(0, prodFn(l = 2, k = 0.02, alpha = 2), prodFn(l = 4, k = 0.02, alpha = 2), prodFn(l = 6, k = 0.02, alpha = 2), ylims[2])
ylabels <- c(NA, expression(paste(0.08)), prodFn(l = 4, k = 0.02, alpha = 2), expression(paste(0.72)), NA)
ticksx <- c(0, 2, 4, 6, xlims[2])
xlabels <- c(NA, 2, 4, 6, NA)

axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis = labelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)


#Label total product
text(6.2, 1.1, expression(paste("Total product")), cex = annotatesize)
text(6.2, 1, expression(x == frac(1,50)*(l)^2), cex = annotatesize)

#Marginal Product
text(7, 0.12, expression(paste("Slope of tangent line")), cex = labelsize)
text(7, 0.05, expression(paste("equals Marginal product")), cex = labelsize)
Arrows(4.7, 0.075, 2.3, 0.075, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)
Arrows(6, 0.16, 6, 0.67, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#Average Product
text(2, prodFn(l = 6, k = 0.02, alpha = 2) - 0.08, expression(paste("Slope of ray from origin")), cex = labelsize)
text(2, prodFn(l = 6, k = 0.02, alpha = 2) - 0.15, expression(paste("equals Average product")), cex = labelsize)
Arrows(1.5, prodFn(l = 6, k = 0.02, alpha = 2) - 0.175, 1.5, prodFn(l = 2, k = 0.02, alpha = 2) + 0.01 , col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)
Arrows(4, prodFn(l = 6, k = 0.02, alpha = 2) - 0.125, 4.75, prodFn(l = 6, k = 0.02, alpha = 2) - 0.125, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

prodFn <- function(l, alpha = 2, k = 0.02) {
  k*l^alpha
}

MprodFn <- function(l, alpha = 2, k = 0.02) {
  k*alpha*l^(alpha - 1)
}

AprodFn <- function(l, alpha = 2, k = 0.02) {
  k*l^(alpha - 1)
}

Mpline <- function(l, constant = 0.3181472, slope = 0.125){
  constant + slope*l
}

xlims <- c(0, 10)
ylims <- c(0, 0.4)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 
a <- c(13, 15, 17)

plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")), 
     xaxt = "n", 
     yaxt = "n", 
     bty = "n",
     xaxs = "i", 
     yaxs = "i")


ticksy <- c(0, 
            AprodFn(l = 2, k = 0.02, alpha = 2), MprodFn(l = 2, k = 0.02, alpha = 2), 
            AprodFn(l = 4, k = 0.02, alpha = 2), MprodFn(l = 4, k = 0.02, alpha = 2), 
            AprodFn(l = 6, k = 0.02, alpha = 2), MprodFn(l = 6, k = 0.02, alpha = 2), 
            ylims[2])
ylabels <- c(NA, 
             AprodFn(l = 2, k = 0.02, alpha = 2), MprodFn(l = 2, k = 0.02, alpha = 2), 
             AprodFn(l = 4, k = 0.02, alpha = 2), MprodFn(l = 4, k = 0.02, alpha = 2), 
             AprodFn(l = 6, k = 0.02, alpha = 2), MprodFn(l = 6, k = 0.02, alpha = 2), 
             NA)
ticksx <- c(0, 2, 4, 6, xlims[2])
xlabels <- c(NA, 2, 4, 6, NA)

axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis = labelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)

xx3 <- seq(1, 3, length.out = npts)
xx4 <- seq(5, 7, length.out = npts)

lines(xx1, MprodFn(xx1, alpha = 2, k = 0.02), col = COLA[3], lwd = graphlinewidth)
lines(xx1, AprodFn(xx1, alpha = 2, k = 0.02), col = COLA[4], lwd = graphlinewidth)

#Axis Labels
mtext(expression(paste("Hours of labor, ", l)), side = 1, line = 2.5, cex = axislabelsize)
text(-1.5, 0.5*ylims[2], expression(paste("Average & marginal product, ", list(ap,mp) )), xpd = TRUE, cex = axislabelsize, srt = 90) 

#Margin
segments(6, 0, 6, ylims[2], lty = 2, col = grays[20] , lwd = segmentlinewidth)
segments(0, MprodFn(l = 6, k = 0.02), 6, MprodFn(l = 6, k = 0.02), lty = 2, col = grays[20] , lwd = segmentlinewidth)
segments(0, AprodFn(l = 6, k = 0.02), 6, AprodFn(l = 6, k = 0.02), lty = 2, col = grays[20] , lwd = segmentlinewidth)
points(6, MprodFn(l = 6, k = 0.02), pch = 16, col = "black", cex = 1.2)
points(6, AprodFn(l = 6, k = 0.02), pch = 16, col = "black", cex = 1.2)

segments(2, 0, 2, ylims[2], lty = 2, col = grays[20] , lwd = segmentlinewidth)
segments(0, MprodFn(l = 2, k = 0.02), 2, MprodFn(l = 2, k = 0.02), lty = 2, col = grays[20] , lwd = segmentlinewidth)
segments(0, AprodFn(l = 2, k = 0.02), 2, AprodFn(l = 2, k = 0.02), lty = 2, col = grays[20] , lwd = segmentlinewidth)
points(2, MprodFn(l = 2, k = 0.02), pch = 16, col = "black", cex = 1.2)
points(2, AprodFn(l = 2, k = 0.02), pch = 16, col = "black", cex = 1.2)

segments(4, 0, 4, 1, lty = 2, col = grays[20] , lwd = segmentlinewidth, xpd = TRUE)
segments(0, MprodFn(l = 4, k = 0.02), 4, MprodFn(l = 4, k = 0.02), lty = 2, col = grays[20] , lwd = segmentlinewidth)
segments(0, AprodFn(l = 4, k = 0.02), 4, AprodFn(l = 4, k = 0.02), lty = 2, col = grays[20] , lwd = segmentlinewidth)
points(4, MprodFn(l = 4, k = 0.02), pch = 16, col = "black", cex = 1.2)
points(4, AprodFn(l = 4, k = 0.02), pch = 16, col = "black", cex = 1.2)


text(6.2, 1.1, expression(paste("Total product")))
text(6.2, 1, expression(x == frac(1,50)*(l)^2))


#Marginal Product
#text(6, 0.1, expression(paste("Slope of tangent line")))
text(7.5, MprodFn(l = 7.5, k = 0.02, alpha = 2) + 0.08, expression(paste("Marginal product")), cex = labelsize, xpd = TRUE)
text(7.5, MprodFn(l = 7.5, k = 0.02, alpha = 2) + 0.05, expression(paste(mp(l) == frac(1,25)*(l) )), cex = labelsize)

#Average Product
text(7.5, AprodFn(l = 7.5, k = 0.02, alpha = 2) - 0.035, expression(paste("Average product")), cex = labelsize)
text(7.5, AprodFn(l = 7.5, k = 0.02, alpha = 2) - 0.065, expression(paste(ap(l) == frac(1,50)*(l) )), cex = labelsize)




dev.off()
