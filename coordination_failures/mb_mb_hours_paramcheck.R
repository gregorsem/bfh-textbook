require(shape)
pdf(file = "coordination_failures/mb_mc_hours_paramcheck.pdf", width = 9, height = 12)

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


#Need to create a stacked graph and 
#use the option mfrow = c(2,1) for that
par(mar =  c(2, 7, 1, 1), mfrow = c(2,1))

indiffA <- function(ea, uA = 46.08) {
  uA + (1/2)*(ea)^2
}

hAopt <- function(alpha = 21, beta = 1/4){
  alpha/(1 + 2*beta)
}

hANE <- function(alpha = 21, beta = 1/4){
  alpha/(1 + 3*beta)
}

output <- function(ea, eb = hANE(alpha = 21), alpha = 21, beta = 1/4){
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
a <- c(uA(ea = hANE(alpha = 21), output(ea = hANE(alpha = 21), eb = hANE(alpha = 21))), 
       uA(ea = hAopt(alpha = 21), output(ea = hAopt(alpha = 21), eb = 0)), 
       300)

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
ticksx <- seq(from = 0, to = xlims[2], by = 3)
xlabels <- seq(from = 0, to = xlims[2], by = 3)
ticksy <- c(0, 144, 225, 300, ylims[2])
ylabels <- c(NA, expression(paste(y[1]^A)), expression(paste(y[2]^A)), expression(paste(y[3]^A)), NA)
# ticksx <- c(0, 6.9, 12, 9.6, 16, 24, 26)
# xlabels <- c(NA, expression(paste(e^A,"*")), expression(paste(1/2*beta)), expression(paste(e^{AN})), expression(paste(alpha)), expression(paste(1/beta)), NA)

axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis= labelsize - 0.05)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis= labelsize - 0.05)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)

lines(xx1, output(xx1, eb = 0), col = COLA[4], lwd = graphlinewidth)
lines(xx1, output(xx1, eb = hANE(alpha = 21)), col = COLA[4], lwd = graphlinewidth)

contour(x, y,
        outer(x, y, uA),
        drawlabels = FALSE,
        col = COLB[4],
        lwd = graphlinewidth,
        levels = a,
        xaxs="i",
        yaxs="i",
        add = TRUE)

segments(12, 300, 12, -300, lty = 2, col = "gray", lwd = segmentlinewidth, xpd = 350)
segments(15, output(ea = 15, eb = 0), 15, -300, lty = 2, col = "gray", lwd = segmentlinewidth, xpd = 350)

# segments(2, 0, 2, ylims[2], lty = 2, col = "gray" , lwd = segmentlinewidth)
# segments(6, 0, 6, ylims[2], lty = 2, col = "gray" , lwd = segmentlinewidth)

#Axis labels
#mtext(expression(paste("A's hours, ", h^A)), side=1, line = 3.2, cex = axislabelsize)
#text(0.5*xlims[2], -40, expression(paste("A's hours, ", h^A)), xpd = TRUE, cex = axislabelsize)
text(-3.5, 0.5*ylims[2], expression(paste("Output, ", y^A," (100 grams)")), xpd = TRUE, cex = axislabelsize, srt = 90)

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
text(12 + 0.5, output(ea = 12) - 6, expression(paste(n*minute)), cex = annotatesize)

points(15, output(ea = 15, eb = 0), pch = 16, col = "black", cex = 1.5)
text(15 + 0.5, output(ea = 15, eb = 0) - 6, expression(paste(s*minute)), cex = annotatesize)


text(14.3, 288, expression(paste(y(h^A, h^B == 0))), cex = annotatesize)
text(19.8, 260, expression(paste(y(h^A, h^B >0))), cex = annotatesize)



MBenefit <- function(ea, eb = 12, alpha = 21, beta = 1/4) {
  (alpha - beta*eb - 2*beta*ea)
}

MCost <- function(ea, slope = 1, intercept = 0){
  slope*ea
}


xlims <- c(0, 24)
ylims <- c(0, 31)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 
a <- c(12, 46.08, 90)

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
ticksy <- c(0, MBenefit(12), MBenefit(15, eb = 0), MBenefit(ea = 0), 30, ylims[2])
ylabels <- c(NA, expression(paste(u[h^An]^A)), expression(paste(u[h^As]^A)), expression(paste(alpha - beta*h^B)), expression(paste(alpha)), NA)
# ticksx <- c(0, 12, 15, 24, 30, xlims[2])
# xlabels <- c(0, 12, 15, 24, 30, xlims[2])
ticksx <- seq(xlims[1], xlims[2], 3)
xlabels <- seq(xlims[1], xlims[2], 3)
#xlabels <- c(NA, expression(paste(h[1]^A)), expression(paste(h[2]^A)), expression(paste(frac(alpha - beta*h^b,2*beta) )), expression(paste(frac(alpha,2*beta) )), NA)

axis(1, at = ticksx, pos = 0, labels = xlabels ,las = 1, cex.axis = labelsize - 0.05)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize - 0.05)
#text(x = c(0, 12, 15, 24, 30, xlims[2]), par("usr")[3] - 0.4, labels = xlabels, srt = 0, pos = 1, xpd = TRUE, cex = labelsize - 0.05)

#mtext(expression(paste("Aram's hours, ", h^A)), side=1, line = 4, cex = axislabelsize)
text(0.5*xlims[2], -4.5, expression(paste("A's hours, ", h^A)), xpd = TRUE, cex = axislabelsize)
text(-3.5, 0.5*ylims[2], expression(paste("A's marginal utility and disutility, ", u[h^A]^A)), xpd = TRUE, cex = axislabelsize, srt = 90) 

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)
xx2 <- seq(4, 8, length.out = npts)

lines(xx1, MBenefit(xx1, eb = 12), col = COLA[4], lwd = graphlinewidth)
lines(xx1, MBenefit(xx1, eb = 0), col = COLA[4], lwd = graphlinewidth)
lines(xx1, MCost(xx1), col = COLB[4], lwd = graphlinewidth)

#For NE hours = 12
# segments(0, 12, 12, 12, lty = 2, col =  "gray", lwd = segmentlinewidth)
segments(12, 0, 12, 300, lty = 2, col = "gray", lwd = segmentlinewidth, xpd = 350)
segments(15, 0, 15, 300, lty = 2, col = "gray", lwd = segmentlinewidth, xpd = 350)


#segments(0, 12, 300, 12, lty = 2, col =  "gray", lwd = segmentlinewidth, xpd = TRUE)

#For P-efficient hours = 10
#segments(0, MBenefit(15, eb = 0), 15, MBenefit(15, eb = 0), lty = 2, col = "gray" , lwd = segmentlinewidth)
#segments(15, 0, 15, MBenefit(15, eb = 0),  lty = 2, col = "gray" , lwd = segmentlinewidth)


text(6, 28.5, expression(paste("Marginal Benefit")), cex = labelsize)
text(6, 27, expression(paste("when, ", h^B== 0 )), cex = labelsize)
#text(8, 26.5, expression(paste("Marginal Benefit")), cex = labelsize)
#text(8, 25, expression(paste("when, ", h^B== 0 )), cex = labelsize)
#text(11.5, 24.3, expression(paste(mb^A== alpha - 2*beta*h^A )), cex = labelsize)
#text(11.5, 22.5, expression(paste("when, ", h^B== 0 )), cex = labelsize)

text(6, 14.5, expression(paste("Marginal Benefit ")), cex = labelsize)
text(6, 13, expression(paste("when, ", h^B > 0 )), cex = labelsize)
#text(5.5, 15.5, expression(paste("Marginal Benefit ")), cex = labelsize)
#text(5.5, 14, expression(paste("when, ", h^B > 0 )), cex = labelsize)
#text(24.5, 13.5, expression(paste(mb^A == alpha - beta*h^B - 2*beta*h^A)), cex = labelsize)
#text(24.5, 12, expression(paste("when, ", h^B > 0 )), cex = labelsize)
#Arrows(21.5, 12.5, 17, 8, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)


text(20, 24, expression(paste("Marginal Disutility")), cex = labelsize)
text(20, 22.5, expression(paste(mc^A == h^A)), cex = labelsize)




points(12, 12, pch = 16, col = "black", cex = 1.5)
text(12 + 0.85, 12.1, expression(paste(n)), cex = labelsize)

points(15, 15, pch = 16, col = "black", cex = 1.5)
text(15 + 0.85, 15.1, expression(paste(s)), cex = labelsize)

#Label the iso-welfare functions for the HG, Aisha
text(9.7, 60, expression(u[1]^A),  cex= labelsize - 0.05)
text(7.6, 60, expression(u[2]^A), cex= labelsize - 0.05)
text(4.8, 60, expression(u[3]^A), cex= labelsize - 0.05)


dev.off()
