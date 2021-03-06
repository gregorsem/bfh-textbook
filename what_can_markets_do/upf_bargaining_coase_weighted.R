require(shape)
pdf(file = "what_can_markets_do/upf_bargaining_coase_weighted.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.8
labelsize <- 1.5
namesize <- 1.8
annotatesize <- 1.5
graphlinewidth <- 2
segmentlinewidth <- 1.5

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#c6dbef", "#4eb3d3", "#2b8cbe", "#0868ac","#084081")
COLC <- c("#fcfbfd", "#efedf5", "#dadaeb", "#bcbddc", "#9e9ac8", "#807dba", "#6a51a3", "#54278f", "#3f007d")
grays <- gray.colors(25, start = 1, end = 0, alpha = 1)

par(mar =  c(1, 3, 2, 2))
xlims <- c(-24, 8)
ylims <- c(-12, 20)

upf <- function(uA, intercept = -9, slope = 1){
  intercept - slope*uA
}


#Plot command 
plot(40, 40, xlim = xlims, ylim = ylims, 
     type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")), 
     axes = FALSE,
     # xlab = expression(paste("Bob's Payoff, ", u^B)),
     # ylab = expression(paste("Alfredo's Payoff, ", u^A)),
     #xaxt = "n", 
     #yaxt = "n", 
     cex.lab = axislabelsize, 
     bty = "n", 
     xaxs="i", 
     yaxs="i"
)


#Rent polygon
xrent <- c(-18, -18, -9, -18)
yrent <- c(0, 9, 0, 0)
polygon(xrent, yrent, col = COL[4], density = NULL, border = NA)

#Customize ticks and labels for the plot
# ticksy <- seq(ylims[1], ylims[2], 1)
# ylabels <- seq(ylims[1], ylims[2], 1)
# ticksx <- seq(xlims[1], xlims[2], 1)
# xlabels <- seq(xlims[1], xlims[2], 1)
ticksy <- c(ylims[1], -9, -4.5, 4.5, 9, ylims[2])
ylabels <- c(NA, NA, NA, NA, NA, NA)
ticksx <- c(xlims[1], -18, -13.5, -9, -4.5, xlims[2])
xlabels <- c(NA, -18, -13.5, -9, -4.5, NA)
axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis = labelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)
#Axis labels
text(xlims[1] + 1, -2, expression(paste("A's utility, ", u^A)), xpd = TRUE, cex = axislabelsize) 
text(1.5, ylims[2] - 3, expression(paste("B's utility, ", u^B)), xpd = TRUE, cex = axislabelsize, srt = 90) 


#Label 2.25 and 4.5
text(-2, 4.5, expression(paste(4.5)), xpd = TRUE, cex = labelsize) 
text(-1.5, 9, expression(paste(9)), xpd = TRUE, cex = labelsize) 
text(-2.5, -4.5 , expression(paste(-4.5)), xpd = TRUE, cex = labelsize) 
text(-1.5, -9 , expression(paste(-9)), xpd = TRUE, cex = labelsize) 
#text(-4.5, 0.5 , expression(paste(-4.5)), xpd = TRUE, cex = labelsize) 


npts <- 500 
xx1 <- seq(xlims[1], -18, length.out = npts)
xx2 <- seq(-18, -9, length.out = npts)
xx3 <- seq(-9, xlims[2], length.out = npts)
lines(xx1, upf(xx1), col = COLA[4], lwd = segmentlinewidth, lty = 2)
lines(xx2, upf(xx2), col = COLA[4], lwd = graphlinewidth)
lines(xx3, upf(xx3), col = COLA[4], lwd = segmentlinewidth, lty = 2)



#Lines for the coordinates of the Nash equilbrium
#text(-15.8, -7, expression(paste("Economic rents, or")), cex = labelsize)
# text(-15.8, -9, expression(paste("Bargaining set")), cex = labelsize)
# Arrows(-15.8, -6, -15.8, 1, col = "black", lty = 1, lwd = 2, arr.type = "triangle")

#Label the UPF
#text(-9, 18, expression(paste("Utility possibilities frontier, or")), cex = labelsize)
#text(-9, 16, expression(paste("bargaining frontier")), cex = labelsize)
text(-10, 12.5, expression(paste("Utility possibilities")), cex = labelsize)
text(-10, 11, expression(paste("frontier (upf)")), cex = labelsize)

Arrows(-11, 10, -11, 3, col = "black", lty = 1, lwd = 2, arr.type = "triangle")

#Lines for Fallback positions
segments(-18, 0, -18, ylims[2], lty = 2, col = grays[20], lwd = segmentlinewidth, xpd = TRUE)
text(-21.8, 20.2, expression(paste("A's participation")), cex = labelsize, xpd = TRUE)
text(-21.8, 19, expression(paste("constraint")), cex = labelsize, xpd = TRUE)
text(-21.8, 17.5, expression(paste(u[b]^A == -18)), cex = labelsize, xpd = TRUE)

text(5, 4.3, expression(paste("B's participation")), cex = labelsize, xpd = TRUE)
text(5, 3, expression(paste("constraint")), cex = labelsize, xpd = TRUE)
text(5, 1.2, expression(paste(u[b]^B == 0)), cex = labelsize, xpd = TRUE)

#Add points

points(0, -9, pch = 16, col = "black", cex = 1.5)
text(0.65, -8.5, expression(paste(a)), cex = labelsize)


points(-9, 0, pch = 16, col = "black", cex = 1.5)
text(-8.5, 1, expression(paste(t^A)), cex = labelsize)

points(-18, 9, pch = 16, col = "black", cex = 1.5)
text(-17.2, 9.8, expression(paste(t^B)), cex = labelsize)

points(-13.5, 4.5, pch = 16, col = "black", cex = 1.5)
text(-13, 5.2, expression(paste(v)), cex = labelsize)

points(-18, 0, pch = 16, col = "black", cex = 1.5)
text(-17.5, 0.8, expression(paste(b)), cex = labelsize)



points(-4.5, -4.5, pch = 16, col = "black", cex = 1.5)
text(-5.2, -5.2, expression(paste(i)), cex = labelsize)



dev.off()

