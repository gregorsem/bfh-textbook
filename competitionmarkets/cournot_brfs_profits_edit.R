#Graph Designer: Simon Halliday & Madeleine Wettach '20
#Authors: Bowles, Foley and Halliday
#Title: Microeconomics: Competition, Conflict and Coordination

require(shape)
pdf(file = "competitionmarkets/cournot_brfs_profits_edit.pdf", width = 9, height = 7)

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
grays <- gray.colors(25, start = 1, end = 0)
CBCols <- c("#009E73","#0072B2","#E69F00","#CC79A7", "#F0E442")

par(mar =  c(5, 7.8, 2, 2))

piA <- function(xa, xb, s = 0.5, pmax = 20, c1 = 2) {
  (pmax - s*xb)*xa - s*(xa)^2 - c1*xa
}

piB <- function(xa, xb, s = 0.5, pmax = 20, c1 = 2) {
  (pmax - s*xa)*xb - s*(xb)^2 - c1*xb
}

brfB <- function(xa, s = 0.5, pmax = 20, c1 = 2) {
  (pmax - c1)/(2*s) - (1/2)*xa
}

brfA <- function(xa, s = 0.5, pmax = 20, c1 = 2) {
  (pmax - c1)/s - 2*xa
}

isoA <- function(xa, s = 0.5, pmax = 20, c1 = 2, piA = 72){
  -(c1*xa - pmax*xa + s*xa^2 + piA)/(s*xa)
}

isoB1 <- function(xa, s = 0.5, pmax = 20, c1 = 2, piB = 72){
  (-sqrt((c1 - pmax + s*xa)^2 - 4*piB*s) - c1 + pmax -s*xa)/(2*s)
}

isoB2 <- function(xa, s = 0.5, pmax = 20, c1 = 2, piB = 72){
  (sqrt((c1 - pmax + s*xa)^2 - 4*piB*s) - c1 + pmax -s*xa)/(2*s)
}


#Input into Wolfram Alpha: solve for x y = 1/b - (0.5*x)/(a*b) - u/(a*b*x)

#solve for y 72 = (p - s*y)*x - s*(x)^2 - c1*x 
#solve for y 72 = (p - s*x)*y - s*(y)^2 - c1*y

xlims <- c(0, 18.5)
ylims <- c(0, 18.5)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 
a <- c(72, 81, 90)
b <- c(72, 81, 90)

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
ticksy <- c(0, 9, 12, 18, ylims[2])
ylabels <- c(NA, expression(paste(x[i]^{B}== 9)), expression(paste(x^{BN}== 12)), expression(paste( frac(bar(p) - c[1],2*beta) )),  NA)
ticksx <- c(0, 9, 12, 18, xlims[2])
xlabels <- c(NA, expression(paste(x[i]^{A}== 9)), expression(paste(x^{AN}== 12)), expression(paste(frac(bar(p) - c[1],2*beta))), NA)

axis(1, at = ticksx, pos = 0, labels = FALSE, cex.axis = labelsize)
text(x = c(0, 8, 12, 18, 36, xlims[2]), par("usr")[3] - 0.4, labels = xlabels, srt = 0, pos = 1, xpd = TRUE, cex = labelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)

#Pareto-improving lens
xpoly1 <- seq(from = 5.95, to = 12, length.out = 500)
ypoly1 <- isoA(xpoly1)
ypoly2 <- isoB1(xpoly1)
polygon(x = c(xpoly1, rev(xpoly1)), y = c(ypoly1, rev(ypoly2)), col=COL[4], density=NULL, border = NA)


lines(xx1, brfA(xx1, s = 0.5, pmax = 20, c1 = 2), col = COLA[4], lwd = graphlinewidth)
lines(xx1, brfB(xx1, s = 0.5, pmax = 20, c1 = 2), col = COLB[4], lwd = graphlinewidth)

contour(y, x, 
        outer(x, y, piA),
        #labels = c("v1", "v2", "v3"),
        drawlabels = FALSE,
        col = CBCols[1],
        #xlab = expression(paste("A's Apples, ", x)),
        #ylab = expression(paste("A's Oranges, ", y)),
        #cex.lab = axislabelsize,
        lwd = segmentlinewidth,
        levels = a, 
        xaxs="i", 
        yaxs="i", 
        add = TRUE) 

mtext(expression(paste("A's output, ", x^A)), side=1, line =3.8, cex = axislabelsize)
text(-3.5, 9, expression(paste("B's output, ", x^B)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#Add arrows:
#arrows(-0.8, 10, -0.8, 14, xpd = TRUE, length=0.1,angle=40,lwd=3)
#arrows(6.2, -1.7, 9, -1.7, xpd = TRUE, length=0.1,angle=40,lwd=3)


contour(x, y, 
        outer(x, y, piB),
        #labels = c("v1", "v2", "v3"),
        drawlabels = FALSE,
        col = CBCols[2],
        #xlab = expression(paste("")),
        #ylab = expression(paste("")),
        lwd = segmentlinewidth,
        levels = b, 
        add = TRUE
        #xaxs="i", 
        #yaxs="i"
) 


#segments(4.11765, 6.17647, 5.88, 8.88, lty = 1, col = COL[2] , lwd = graphlinewidth)
# text(7.3, 3, expression("Pareto Efficient"))
# text(7.3, 2.4, expression("Curve"))
# Arrows(7.3, 3.5, 7.3, 6.1, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#Label the iso-welfare functions for the HG, Aisha
text(4.5, 1.5, expression(pi[1]^A), cex = labelsize, xpd = TRUE)
#text(5.2, 1.5, expression(pi[2]^A), cex = labelsize, xpd = TRUE)
text(6, 1.5, expression(pi[2]^A), cex = labelsize, xpd = TRUE)
text(6.9, 1.5, expression(pi[3]^A), cex = labelsize, xpd = TRUE)
#text(6.6, 8.3, expression(u[4]^A))

#Label the indifference curves for the HG, Betty
#text(11.9, 18, expression(pi[Vic]^B),cex = labelsize, xpd = TRUE)
text(10.5, 18, expression(pi[1]^B), cex = labelsize, xpd = TRUE)
#text(9.4, 18, expression(pi[2]^B), cex = labelsize, xpd = TRUE)
text(8.5, 18, expression(pi[2]^B), cex = labelsize, xpd = TRUE)
text(7.4, 18, expression(pi[3]^B), cex = labelsize, xpd = TRUE)
#text(3.4, 6.9, expression(v[4]^B))

#Label Nash Equilibrium 
segments(0, 12, 12, 12, lty = 2, col = grays[20] , lwd = segmentlinewidth)
segments(12, 0, 12, 12, lty = 2, col = grays[20] , lwd = segmentlinewidth)
points(12, 12, pch = 16, col = "black", cex = 1.5)
#text(14, 12.4, expression(paste("Nash Equilibrium")))
text(11.5, 11.5, expression(paste("n")), cex = labelsize)

#Checking points
#points(5.95, 5.95, pch = 16, col = "black", cex = 1.5)
segments(5, 13, 13, 5, lty = 2, col = CBCols[4] , lwd = graphlinewidth)

segments(8, 10, 10, 8, lty = 1, col = CBCols[4] , lwd = graphlinewidth)


text(9, 9.6, expression(paste("i")), cex = labelsize)
segments(0, 9, 9, 9, lty = 2, col = grays[20] , lwd = segmentlinewidth)
segments(9, 0, 9, 9, lty = 2, col = grays[20] , lwd = segmentlinewidth)
#segments(13.5, 0, 13.5, 9, lty = 2, col = grays[20] , lwd = segmentlinewidth)
points(9, 9, pch = 16, col = "black", cex = 1.5)
# points(13.5, 9, pch = 16, col = "black", cex = 1.5)
# text(13.45, 9.6, expression(paste("d")), cex = labelsize)


points(10, 8, pch = 16, col = "black", cex = 1.5)
text(10, 8 - 0.8, expression(paste(t^A)),cex = labelsize)
points(8, 10, pch = 16, col = "black", cex = 1.5)
text(8, 10 + 0.8, expression(paste(t^B)), cex = labelsize)


# #Annotate Pareto Efficient Curve and relevant points
text(4.5, 11, expression(paste("Pareto-efficient")), cex = labelsize)
text(4.5, 10, expression(paste("curve")), cex = labelsize)

#B's brf
text(3, 14.9, expression(paste("B's best-response")), cex = labelsize)
text(3, 14.2, expression(paste("function")),cex = labelsize)
#Arrows(2, 14.5, 2, 16.5, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#A's brf
text(13.1, 4, expression(paste("A's best-response")), cex = labelsize, xpd = TRUE)
text(13.1, 3.3, expression(paste("function")), cex = labelsize, xpd = TRUE)
#Arrows(14, 3, 15.8, 3, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)


dev.off()
