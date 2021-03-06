# Graph Designer: Scott Cohn + Simon Halliday

library(shape)
library(pBrackets)
pdf(file = "capitalism/wage_share_unemployment.pdf", width = 10, height = 8)

#Set parameters for graphics
pointsize <- 1.8
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


# Wage Share
WageFn <- function(H, delta = 5) {
  (delta /(1 - H)) * 0.01
}

#Edited the margins to cater for the larger LHS labels
par(mar =  c(5, 6, 2, 2))


#Add limits on axes and levels of utility for each indifference curve
ylims <- c(0, 1)
xlims <- c(0, 1)

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
     xaxs = "i", 
     yaxs = "i"
)

#Calculate the Gini
#Area B:
#((0.5*(0.25*0.5)) + 0.25*0.5 + 0.5*(0.75*0.5))
#Therefore Area A: 
#0.5 - Area B
#Therefore Gini: 
# (0.5 - ((0.5*(0.25*0.5)) + 0.25*0.5 + 0.5*(0.75*0.5)))/0.5 = 0.25

ticksy <- c(ylims[1], 0.6, 0.76, ylims[2])
ylabels <- c(0, expression(paste(0.60)), expression(paste(0.76)), expression(paste(1.0)))
ticksx <- c(xlims[1], 0.78467, 0.83, 0.85, xlims[2])
xlabels <- c(NA, 78, NA, NA, 90)
ticksy2 <- c(0,1)

text(0.87, -0.043, expression(paste(85)), xpd = TRUE, cex = labelsize) 
text(0.83, -0.043, expression(paste(83)), xpd = TRUE, cex = labelsize) 

axis(1,at = ticksx,  pos = 0, labels = xlabels, cex.axis = labelsize)
axis(2,at = ticksy,  pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)
axis(4,at = ticksy2,  pos = 1, labels = NA, las = 1, cex.axis = labelsize)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)
xx2 <- seq(0, xlims[2], length.out = npts)
xx3 <- seq(xlims[1], 0, length.out = npts)

#Axis labels and draw linear utility function
#mtext(expression(paste("Cumulative population proportion, ", F(n))), side = 1, line = 2.5, cex = axislabelsize)
text(-0.1, 0.5*ylims[2], expression(paste("Wage, w")), xpd = TRUE, cex = axislabelsize, srt = 90) 
text(0.5*xlims[2], -0.1, expression(paste("Employment, ", H)), xpd = TRUE, cex = axislabelsize) 



#Shaded Areas A and B
#Area A
#xpoly1 <- c(0, 0.1, 0.9, 1, 0)
#ypoly1 <- c(0, 0, 0.6, 1, 0)
#polygon(x = xpoly1,
#        y = ypoly1,
#        col = COLB[1], density = NULL, border = NA)
#Area B
#xpoly2 <- c(0, 0.1, 1, 1, 0.9, 0.1)
#ypoly2 <- c(0, 0, 0, 1, 0.6, 0)
#polygon(x = xpoly2,
#        y = ypoly2,
#        col = COLA[1], density = NULL, border = NA)

# Wage Curve

lines(xx1, WageFn(xx1, delta = 12.92), col = COLA[4], lwd = graphlinewidth)
lines(xx1, WageFn(xx1, delta = 9), col = COLA[4], lty = 1, lwd = graphlinewidth)


#Line of equality

segments(0.785, 0, 0.785, 0.6, lty = 2, col = grays[20], lwd = segmentlinewidth)
segments(0.83, 0, 0.83, 0.76, lty = 2, col = grays[20], lwd = segmentlinewidth)
segments(0.85, 0, 0.85, 0.6, lty = 2, col = grays[20], lwd = segmentlinewidth)

segments(0, 0.76, 1, 0.76, lty = 1, col = COLB[4], lwd = segmentlinewidth)
segments(0, 0.6, 1, 0.6, lty = 1, col = COLB[4], lwd = segmentlinewidth)


# Points
points(0.7847, 0.6, pch = 16, col = "black", cex = 1.5)
points(0.83, 0.76, pch = 16, col = "black", cex = 1.5)

points(0.85, 0.6, pch = 16, col = "black", cex = 1.5)

# Label
text(0.81, 0.78, expression(paste(a)), cex = labelsize)
text(0.76, 0.62, expression(paste(b)), cex = labelsize)
text(0.87, 0.58, expression(paste(c)), cex = labelsize)

text(0.2, 0.29, expression(paste("Original")), cex = labelsize)
text(0.2, 0.25, expression(paste("wage")), cex = labelsize)
text(0.2, 0.21, expression(paste("curve, ", w[0]^N )), cex = labelsize)
Arrows(0.4, 0.2, 0.5, 0.2, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5, code = 2)

text(0.65, 0.2, expression(paste("New")), cex = labelsize)
text(0.65, 0.16, expression(paste("wage")), cex = labelsize)
text(0.65, 0.12, expression(paste("curve, ", w[1]^N)), cex = labelsize)


text(0.2, 0.88, expression(paste("Original")), cex = labelsize)
text(0.2, 0.84, expression(paste("competition")), cex = labelsize)
text(0.2, 0.8, expression(paste("condition")), cex = labelsize)
Arrows(0.2, 0.75, 0.2, 0.62, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5, code = 2)


text(0.2, 0.56, expression(paste("New")), cex = labelsize)
text(0.2, 0.52, expression(paste("competition")), cex = labelsize)
text(0.2, 0.48, expression(paste("condition")), cex = labelsize)

# text(0.9, 0.7, expression(paste(B[3])), cex = labelsize)

#Label and provide Gini value
#Bottom of frame
#segments(0.08, 0.75, 0.32, 0.75, lty = 1, col = "black" , lwd = 1)
#Top of frame
#segments(0.08, 0.85, 0.32, 0.85, lty = 1, col = "black" , lwd = 1)
#Left of frame
#segments(0.08, 0.75, 0.08, 0.85, lty = 1, col = "black" , lwd = 1)
#Right of frame
#segments(0.32, 0.75, 0.32, 0.85, lty = 1, col = "black" , lwd = 1)
#Gini equation
#text(0.2, 0.8, expression(paste(Gini == frac(A, A + B), phantom() == 0.36 )), cex = labelsize)



# brackets(x1 = 1.01, y1 = 1, x2 = 1.01, y2 = 0.252,  
#          ticks = 0.5, curvature = 0.5, type = 1, 
#          col = "black", lwd = 2, lty = 1, xpd = TRUE)
# text(1.11, 0.625, expression(paste("Cumulative income")), xpd = TRUE, srt = 270)
# text(1.08, 0.625, expression(paste("of the rich")), xpd = TRUE, srt = 270)


dev.off()

