require(shape)
require(plotrix)
library(pBrackets)
pdf(file = "employment/employment_wage_macro.pdf", width = 9, height = 7)

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
grays <- gray.colors(25, start = 1, end = 0)


WageFn <- function(h, ubar = 3, B = 2, t = 0.8) {
  B + ubar + (ubar - ubar*t +  ubar*t*h )/(t*(1 - h))
}

par(mar =  c(7, 6, 1, 7))

xlims <- c(0, 1.05)
ylims <- c(0, 40)

plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")),
     xaxt = "n", 
     yaxt = "n",
     cex.lab = axislabelsize, 
     bty = "n", 
     xaxs="i", 
     yaxs="i")

npts <- 500 
npts2 <- 501
#Specify the sequences of points for graphing. 
xx1 <- seq(xlims[1], 0.9, length.out = npts)
xx2 <- seq(xlims[1], xlims[2], length.out = npts)
xx3 <- seq(xlims[1], xlims[2], length.out = npts2)
xx4 <- seq(xlims[1], 25, length.out = npts2)

#Draw the lines for the graphs
lines(xx1, WageFn(xx1), col = COLA[4], lwd = graphlinewidth)
#lines(xx2, solowCondition(xx2, delta = 5), col = COL[3], lwd = 4)
#lines(xx2, solowInfeas(xx2, delta = 5), col = COL[1], lwd = 4, lty = 2)

#Customize ticks and labels for the plot
ticksy <- c(0, 5, WageFn(h = 0.7), 40)
ylabels <- c(0, expression(paste(B+underline(u))), expression(paste(w[a]^N*(H[a]))), NA)
ticksx <- c(0, 0.7, 1, xlims[2])
xlabels <- c(0, expression(paste(H[a])), 1.0, NA)
axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis = labelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1,cex.axis = labelsize)

#Axis labels
text(-.16,  1 + 0.5*ylims[2], expression(paste("Wage, ", w)), cex = axislabelsize, xpd = TRUE, srt = 90)
text(0.55, -8, expression(paste("Hours of employment as a fraction of labor supply, ", H)), cex = axislabelsize,  xpd =TRUE)

#Annotation of the  graphs
text(0.7, 35, expression(paste("Wage Curve, ", w^N,(H))), cex = labelsize)
segments(0, 5, 1, 5, lty = 2, lwd = segmentlinewidth, col = grays[20])


#Labor supply
segments(1, 0, 1, 42, lty = 2, lwd = segmentlinewidth, col = grays[20])
text(1.07, 39, expression(paste("Labor")), cex = labelsize, xpd = TRUE)
text(1.07, 37, expression(paste("supply")), cex = labelsize, xpd = TRUE)

segments(0.7, 0, 0.7, 14.5, lty = 2, lwd = segmentlinewidth, col = grays[20])
segments(0, WageFn(0.7), 1, 14.5, lty = 2, lwd = segmentlinewidth, col = grays[20])
points(0.7, 14.5, pch = 16, col = "black", cex = 1.5)
text(0.7, 14.5 + 1.5, expression(paste(a)), cex = labelsize)


#Labels
text(0.35, -4, expression(paste("Employed")), cex = labelsize,  xpd =TRUE)
text(0.85, -4, expression(paste("Unemployed")), cex = labelsize,  xpd =TRUE)

text(1.1, 10, expression(paste("Rent")), cex = labelsize,  xpd =TRUE)
text(1.15, 3.5, expression(paste("Willingness")), cex = labelsize,  xpd =TRUE)
text(1.15, 1.5, expression(paste("to sell")), cex = labelsize,  xpd =TRUE)

#Arrows
# Arrows(0.55, 7, 0.55, 9, col = "black", lty = 1, lwd = 2, arr.type = "triangle")
# Arrows(0.55, 7, 0.55, 6, col = "black", lty = 1, lwd = 2, arr.type = "triangle")


#Brackets
#Employed
brackets(x1 = 0.67, y1 = -1, x2 = 0.02, y2 = -1,  
         ticks = 0.5, curvature = 0.5, type = 1, 
         col = "black", lwd = 2, h = 2,
         lty = 1, xpd = TRUE)
#Unemployed
brackets(x1 = 0.98, y1 = -1, x2 = 0.73, y2 = -1,  
         ticks = 0.5, curvature = 0.5, type = 1, 
         col = "black", lwd = 2, h = 2,
         lty = 1, xpd = TRUE)
#Rent
brackets(x1 = 1.02, y1 = 14.8, x2 = 1.02, y2 = 5.2,  
         ticks = 0.5, curvature = 0.5, type = 1, 
         col = "black", lwd = 2, h = 0.03,
         lty = 1, xpd = TRUE)

#Willingness to sell
brackets(x1 = 1.02, y1 = 4.8, x2 = 1.02, y2 = 0.2,  
         ticks = 0.5, curvature = 0.5, type = 1, 
         col = "black", lwd = 2, h = 0.03,
         lty = 1, xpd = TRUE)


#Line for the absolute maximum quality
#segments(1, 0, 1, 42, lty = 2, lwd = 3, col = "darkgray")
#segments(0.75, 0, 0.75, 20, lty = 2, lwd = 2, col = "darkgray")

#Arrow to Slope of BRF
#Arrows(0.5, 13, 0.58, 13, col = "black", lty = 1, lwd = 2, arr.type = "triangle")
#text(0.35, 13, expression(paste("Slope = " - u[q], " = ", frac(delta, (1 - q)^2))))


#Arrows(0.8, 15, 0.8, 19, col = "black", lty = 1, lwd = 2, arr.type = "triangle")
#Arrows(0.8, 15, 0.8, 6, col = "black", lty = 1, lwd = 2, arr.type = "triangle")
#text(0.92, 12.5, expression(paste("Employment Rent")))

#Text to indicate delta = 5
#text(0.2, 38, expression(paste("Wage Function")))
#text(0.2, 36, expression(paste("set to ", delta, " = 5")))


#Zero profit condition 
#segments(0, 20, 0.75, 20, lty = 1, lwd = 2, col = "darkgray")
#segments(0.75, 20, 1.2, 20, lty = 2, lwd = 2, col = "darkgray")

#Unemployment benefits & a
#segments(0, 5, 1.2, 5, lty = 2, lwd = 2, col = grays[20])
#segments(0, 2.5, 1.2, 2.5, lty = 2, lwd = 2, col = grays[20])

#Zero profit condition
#text(1.02, 21, expression(paste("Zero profit condition, ", w == w[0])))
#text(0.95, 6, expression(paste(B + underline(u)[t], " (opportunity cost of work)")),cex = labelsize,xpd =TRUE)
#text(0.95, 3.5, expression(paste(B, " (unemployment benefits)")),cex = labelsize, xpd =TRUE)
#text(1.08, 36, expression(paste("level of")))
#text(1.08, 34, expression(paste("employment, ", bar(H))))


dev.off()

