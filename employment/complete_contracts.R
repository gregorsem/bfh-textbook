require(ggplot2)
require(shape)
library(pBrackets)
require(plotrix)
pdf(file = "employment/complete_contracts_figure.pdf", width = 9, height = 7)

#Set parameters for graphics
pointsize <- 1.8
axislabelsize <- 1.8
labelsize <- 1.5
namesize <- 1.8
annotatesize <- 1.5
graphlinewidth <- 2
segmentlinewidth <- 1.5

Fn <- function(t, ubar = 0.5, b = 0, j = 0.5) {
  (ubar)/(j*t) + b
}

Incomp <- function(t, ubar = 0.5, b = 0, j = 0.5) {
  (ubar)/(j*t) + b
}

#COL <- c("#1B9E77", "#D95F02", "#7570B3", "#E7298A", "#66A61E", "#E6AB02", "#A6761D", "#666666")
COL <- c("#238b45","#7fc97f", "#beaed4", "#fdc086", "#ffff99")
par(mar =  c(4, 5, 3, 10))
xlims <- c(0, 1)
ylims <- c(0,5)


plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste(""), cex = axislabelsize),
     ylab = expression(paste(""), cex = axislabelsize),
     xaxt = "n", yaxt = "n", cex.lab = axislabelsize, bty = "n")

npts <- 500 
npts2 <- 501
#Specify the sequences of points for graphing. 
xx1 <- seq(0, 1, length.out = npts)
xx2 <- seq(xlims[1], xlims[2], length.out = npts)
xx3 <- seq(xlims[1], xlims[2], length.out = npts2)
xx4 <- seq(xlims[1], 25, length.out = npts2)

#Draw the lines for the graphs
lines(xx1, Fn(xx1), col = COL[1], lwd = graphlinewidth)
lines(xx1, Fn(xx1, j = 0.2), col = COL[1], lwd = graphlinewidth)
lines(xx1, Fn(xx1, j = 0.8), col = COL[1], lwd = graphlinewidth)


#Customize ticks and labels for the plot
ticksy <- c(0,1,4.5,5)
ylabels <- c(0, NA, NA, NA)
ticksx <- c(0,0.22,1)
xlabels <- c(0, NA, 1)
axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis = labelsize)

axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)

#Segments
segments(0, 1, 1.1, 1, lty = 2, lwd = 1.5, col = "darkgray", xpd = TRUE)
segments(1, 0, 1, 4.5, lty = 2, lwd = 1.5, col = "darkgray")
segments(0.22,0,0.22,4.5,lty = 2, lwd = 1.5, col = "darkgray", xpd = TRUE)
segments(0, 4.5, 1.1,4.5, lty = 2, lwd = 1.5, col = "darkgray", xpd = TRUE)

#Axis tick labels
#y
text(-0.1, 4.5, expression(paste(gamma*p==1)), cex = labelsize, xpd = TRUE)
#text(-0.05, 0.8, expression(paste(p^B)), cex = labelsize, xpd = TRUE)
#x
text(0.22, -0.25, expression(paste(underline(t)*j)), cex = labelsize, xpd = TRUE)
#text(1, -0.07, expression(paste(1)), cex = labelsize, xpd = TRUE)

#Text annotations
text(0.42, 5.45, expression(paste("No-shirking condition")), cex = labelsize, xpd = TRUE)
text(0.42, 5, expression(paste(w^N== B + underline(u) + frac(underline(u)*(1 - t) , t*j))), cex = labelsize, xpd = TRUE)
text(-0.1, 1, expression(paste(B + underline(u))), cex = labelsize, xpd = TRUE)
#text(1.15, 4.5, expression(paste(gamma[p])), cex = labelsize, xpd = TRUE)
text(0.43, 1.55, expression(paste("Employee's rent")), cex = labelsize, xpd = TRUE)
text(0.44, 3.8, expression(paste("Employer's profit")), cex = labelsize, xpd = TRUE)

text(1.3, 3, expression(paste("Total")), cex = labelsize, xpd = TRUE)
text(1.3, 2.7, expression(paste("economic")), cex = labelsize, xpd = TRUE)
text(1.3, 2.4, expression(paste("surplus")), cex = labelsize, xpd = TRUE)

text(1.25, 4.5, expression(paste("Willingness")), cex = labelsize, xpd = TRUE)
text(1.25, 4.2, expression(paste("to pay")), cex = labelsize, xpd = TRUE)

text(1.25, 1, expression(paste("Willingness")), cex = labelsize, xpd = TRUE)
text(1.25, 0.7, expression(paste("to work")), cex = labelsize, xpd = TRUE)


#Brackets
brackets(x1 = 1.05, y1 = 4.4, x2 = 1.05, y2 = 1.1,  ticks = 0.5, curvature = 0.5, type = 1, 
         col = "black", lwd = 2, lty = 1, xpd = TRUE)


# #Arrows
Arrows(0.38, 1.7, .38, 2.4, col = "black", lty = 1, lwd = 2, arr.type = "triangle")
Arrows(0.38, 1.42, 0.38, 1.1, col = "black", lty = 1, lwd = 2, arr.type = "triangle")
Arrows(0.38, 3.9, 0.38, 4.4, col = "black", lty = 1, lwd = 2, arr.type = "triangle")
Arrows(0.38, 3.65, 0.38, 2.8, col = "black", lty = 1, lwd = 2, arr.type = "triangle")

#Axes labels
text(0.5, -0.7, expression(paste("Degree of contractual completeness")), xpd = TRUE, cex = axislabelsize) 
text(-0.15, 2.5, expression(paste("Wage and  price")), xpd = TRUE, cex = axislabelsize,srt = 90) 

text(0.9, 0.5, expression(paste(j == 0.8)), cex = labelsize, xpd = TRUE)
text(0.9, 1.35, expression(paste(j == 0.5)), cex = labelsize, xpd = TRUE)
text(0.9, 3.2, expression(paste(j == 0.2)), cex = labelsize, xpd = TRUE)

dev.off()

